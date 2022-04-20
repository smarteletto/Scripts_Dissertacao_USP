getwd()

rm(list = ls())

### CARGA DO DATASET
vbase.ind.exp.rot <-  read.table('VBASE_indic_s.media_rot_expand_251121.csv',
                                 sep = ',', header = TRUE,
                                 stringsAsFactors = FALSE)
nrow(vbase.ind.exp.rot)
ncol(vbase.ind.exp.rot)
#View(vbase.ind.exp.rot)

############################# MODELAGEM ###############################
## DEFININDO VARIAVEIS PREDITORAS
qtcol.vbase <- ncol(vbase.ind.exp.rot)
atrib <- vbase.ind.exp.rot[, -c(qtcol.vbase)]
nrow(atrib)
ncol(atrib)
#View(atrib)
atrib.v <- names(atrib)

## DEFININDO HORIZ = JANELA DESLIZANTE PARA GARANTIR PREVISIBILIDADE
# (nesse caso, N?O haver? deslocamento pois o mesmo j? foi
#  realizado na etapa de rotulagem do dataset-base, ou seja,
#  aqui o valor de h assume 1, que implica em nenhum dia deslocado)
szv <- nrow(vbase.ind.exp.rot)
horiz <- 1
vbase.ind.exp.rot$RotGer <- c(vbase.ind.exp.rot$RotGer[horiz:szv],
                              rep(NA, (horiz-1)))
vbase.ind.exp.rot <- na.omit(vbase.ind.exp.rot)
szv <- nrow(vbase.ind.exp.rot)

## DEFININDO VARIAVEL TARGET COMO FATOR
vbase.ind.exp.rot$RotGer <- as.factor(vbase.ind.exp.rot$RotGer)

## DIVISAO DATASET em TREINAMENTO e TESTE
szvtrain <- floor(szv*0.75)
idxtrain <- 1:szvtrain
idxtest <- (szvtrain + horiz):szv

vtrain <- vbase.ind.exp.rot[idxtrain, ]
sztrain <- nrow(vtrain)
vtest <- vbase.ind.exp.rot[idxtest, ]
sztest <- nrow(vtest)

## TREINAMENTO
Xtrain <- vtrain[, atrib.v]
#View(Xtrain)
Vtrain <- data.frame(Xtrain[,], class = vtrain$RotGer)
#View(Vtrain)

## TESTE
Xtest <- vtest[, atrib.v]
#View(Xtest)
Vtest <- data.frame(Xtest[,], class = vtest$RotGer)
#View(Vtest)

######################## CARET - MAX KUHN ######################
install.packages('AppliedPredictiveModeling')
install.packages('caret')
install.packages('MLmetrics')
library(AppliedPredictiveModeling)
library(caret)
library(MLmetrics)

### SALVANDO UM VETOR COM NOMES VARIAVEIS PREDITORAS
# predVars <- names(adData) [!(names(adData) %in% c('Class', 'Genotype'))]
# ja temos esse vetor = atrib.v

### COMPUTANDO AREA S/ CURVA ROC, SENSIBILIDADE, ESPECIFICIDADE, ACURACIA
fiveStats <- function(...) c(multiClassSummary(...),
                             defaultSummary(...)) # out twoclasssummary
# in multiClassSummary(...)

### CRIANDO REAMOSTRAGENS P/ USO EM TODOS OS MODELOS
index <- createMultiFolds(Vtrain$class, times = 5)

### CRIANDO VETOR DE TAMANHOS DE SUBSETS PARA AVALIACAO
varSeq <- seq(1, length(atrib.v) - 1, by = 1)

##### ELIMINACAO RECURSIVA DE ATRIBUTOS
### FUNCOES RANDOM FOREST INTERNAS DO CARET ESTAO EM rfFuncs
str(rfFuncs)

### CALCULANDO CONJUNTO EXPANDIDO DAS METRICAS PERFORMANCE LISTADAS ACIMA
newRF <- rfFuncs
newRF$summary <- fiveStats

### RODANDO PROCEDIMENTO RFE PARA RANDOM FORESTS
#install.packages('parallel')
install.packages('doMC')
library(doMC)
library(parallel)
library(randomForest)

# FUN?AO control
ctrl <- rfeControl(method = 'repeatedcv',
                   repeats = 5,
                   verbose = TRUE,
                   functions = newRF,
                   index = index,
                   allowParallel = TRUE)
#?rfeControl

# DEFININDO O NUMERO DE NUCLEOS PARA PROCESSAMENTO PARALELO
registerDoMC(cores = 20)

tempo.exec <- system.time(
rfRFE <- rfe(x = Vtrain[, atrib.v],
             y = Vtrain$class,
             sizes = varSeq,
             metric = 'Accuracy',
             rfeControl = ctrl,
             ntree = 2000)
)
print(tempo.exec)

# RESULTADOS OBTIDOS
rfRFE
#names(rfRFE)
rfRFE$optVariables
#rfRFE$times
#rfRFE$metric
#rfRFE$pred
#rfRFE$variables
#rfRFE$results
#rfRFE$bestSubset
#rfRFE$optsize
#rfRFE$control

best3 <- rfRFE$optVariables

### PREDICAO PARA NOVAS AMOSTRAS DE DADOS (teste)
#?predict.rfe
pred.3RFE2000 <- predict(rfRFE, Xtest)
View(pred.3RFE2000)

# COMPARANDO VETORES
x <- pred.3RFE2000$pred
class(x)
length(x)
head(x, 10)

y <- Vtest$class
class(y)
length(y)
head(y, 10)

# COMPARANDO VETORES pred.RFE500 (x) x Vtest$class (y)
identical(x, y)
w <- x == y
head(w, 10)
tail(w, 10)
z <- table(w)['TRUE']
z

acertos.rfe <- z/length(x)
acertos.rfe

# SALVANDO RESULTADOS DA MODELAGEM
save(list = ls(), file = 'Output_Selection_s.media_expand_rot_3RFE2000_011221.rdata')
load(file = 'Output_Sel_s.media_expand_rot_3RFE2000_011221.rdata')
