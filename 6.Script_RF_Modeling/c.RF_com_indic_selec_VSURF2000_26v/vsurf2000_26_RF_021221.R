getwd()

rm(list = ls())

### CARGA DO DATASET (indicadores expandidos)
dados <-  read.table('vbase.26.vsurf2000.csv',
                                  sep = ',', header = TRUE,
                                  stringsAsFactors = FALSE)

indic.expand <- dados[, -c(1)]
nrow(indic.expand)
ncol(indic.expand)
#View(indic.expand)

############################# MODELAGEM ###############################
## DEFININDO VARIAVEIS PREDITORAS
qtcol.vbase <- ncol(indic.expand)
atrib <- indic.expand[, -c(qtcol.vbase)]
nrow(atrib)
ncol(atrib)
#View(atrib)
atrib.v <- names(atrib)
#atrib.v

## DEFININDO HORIZ = JANELA DESLIZANTE PARA GARANTIR PREVISIBILIDADE
# (nesse caso, NÃO haverá deslocamento pois o mesmo já foi
#  realizado na etapa de rotulagem do dataset base, ou seja,
#  aqui o valor de h assume 1, que implica em nenhum dia deslocado)
szv <- nrow(indic.expand)
horiz <- 1
indic.expand$RotGer <- c(indic.expand$RotGer[horiz:szv],
                                        rep(NA, (horiz-1)))
indic.expand <- na.omit(indic.expand)
szv <- nrow(indic.expand)

## DEFININDO VARIAVEL TARGET COMO FATOR
indic.expand$RotGer <- as.factor(indic.expand$RotGer)

## DIVISAO DATASET em TREINAMENTO e TESTE
szvtrain <- floor(szv*0.75)
idxtrain <- 1:szvtrain
idxtest <- (szvtrain + horiz):szv

vtrain <- indic.expand[idxtrain, ]
sztrain <- nrow(vtrain)
vtest <- indic.expand[idxtest, ]
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

########################### RANDOM FOREST #############################
library(randomForest)
## APLICANDO RANDOM FOREST PADRAO
RFDef <- randomForest(class ~ ., data = Vtrain, ntree = 2000)
RFDef

## CALCULANDO ERROS de TESTE e TREINAMENTO (empirico)
errTestRFDef <- mean(predict(RFDef, Xtest) != Vtest$class)
errEmpRFDef <- mean(predict(RFDef, Xtrain) != Vtrain$class)
print(errTestRFDef)
print(errEmpRFDef)

## OBS: Lauretto - matriz de confusao para o conjunto de teste
table(Vtest$class, predict(RFDef, Xtest))

## GRAFICO DO ERRO OUT-OF-BAG
plot(RFDef)

## ALTERANDO PARAMETROS (ntree => otimizar OOB)
#RFDoTrace <- randomForest(class ~ ., data = Vtrain,
                          #ntree = 500, do.trace = 25) # 400-500

## ALTERANDO PARAMETROS (mtry - variaveis utilizadas split em cada no)
#nbvars <- 1:(ncol(Vtrain) - 1)
#oobsMtry <- sapply(nbvars, function(nbv) {
  #RF <- randomForest(class ~ ., Vtrain, ntree = 500, mtry = nbv)
  #return(RF$err.rate[RF$ntree, 'OOB'])
#})

# each.min(oobsMtry) - incluir na RFDefImp
#print(oobsMtry)
#plot(oobsMtry,
     #main = "Erro OOB x Mtry - Indicadores Expandidos - 3 dias")

#mean(replicate(n = 25, randomForest(class ~ ., Vtrain, ntree = 500)$err.rate[500, 'OOB']))

## INDICE VI (parametro importance = T)
RFDefImp <- randomForest(class ~ ., data = Vtrain, importance = TRUE)
varImpPlot(RFDefImp, type = 1, scale = FALSE,
           n.var = ncol(Vtrain) - 1, cex = 0.8,
           main = "Import. Var. - 26 Indicadores Selecionados VSURF2000 - 5 dias - treino = 75%")

################ METRICAS PARA CLASSIFICACAO MULTI-CLASSE #################
library(mltest)
library(mltools)
library(caret)

v1 <- Vtest$class # (classes reais = rotuladas)
length(v1)
head(v1, 10)

v2 <- predict(RFDef, Xtest) # (classes preditas)
length(v2)
head(v2, 10)

metric_classif <- ml_test(v2, v1, output.as.table = FALSE)

### PRECISAO
precisao <- metric_classif$precision
precisao

### RECALL
recall <- metric_classif$recall
recall

### ACURACIA
acuracia <- metric_classif$accuracy
acuracia

### F1 score
f1score <- metric_classif$F1
f1score
# macro-F1
macro.F1 <- (f1score[1] + f1score[2] + f1score[3])/length(f1score)
macro.F1
# ponderada-F1
t <- table(vtest$RotGer, predict(RFDef, Xtest))
class_1 <- sum(t[, 1])
class.0 <- sum(t[, 2])
class.1 <- sum(t[, 3])
ponderada.F1 <- ((f1score[1] * class_1) + (f1score[2] * class.0) +
                   (f1score[3] * class.1))/length(v1)
ponderada.F1

### COEFICIENTE MATTHEWS 1 (coeficiente global - pacote ml_tools)
matthew.1 <- mcc(v2, v1)
matthew.1

### COEFICIENTE KAPPA
kappa <- confusionMatrix(v1, v2)
kappa

### COEFICIENTE MATTHEWS 2 (coeficiente para cada classe - pacote ml_test)
matthews.2 <- metric_classif$MCC
matthews.2
matthews.2.pond <- ((matthews.2[1] * class_1) + (matthews.2[2] * class.0) +
                      (matthews.2[3] * class.1))/length(v1)
matthews.2.pond
