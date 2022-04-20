install.packages('randomForest')
install.packages('VSURF')
install.packages('parallel')
install.packages('snow')
library(randomForest)
library(VSURF)
library(parallel)
library(snow)

rm(list = ls())

### CARREGAMENTO DATASETS
# TREINO
dados.train <-  read.table('Vtrain_s.media_expand_rot_251121.csv',
                           sep = ',', header = TRUE,
                           stringsAsFactors = FALSE)

Vtrain <- dados.train[, -c(1)]
nrow(Vtrain)
ncol(Vtrain)
Vtrain$class <- as.factor(Vtrain$class)
#View(Vtrain)

# TESTE
dados.test <-  read.table('Vtest_s.media_expand_rot_251121.csv',
                          sep = ',', header = TRUE,
                          stringsAsFactors = FALSE)

Vtest <- dados.test[, -c(1)]
nrow(Vtest)
ncol(Vtest)
Vtest$class <- as.factor(Vtest$class)
#View(Vtest)

# NUMERO DE ARVORES VSURF + NUMERO NUCLEOS PARA PROCESSAMENTO
ntree = 2000
coresqty = 20

# VSURF - RESUMO
# passo 1: limiarizacao = elimina variaveis irrelevantes do dataset;
# passo 2: interpretacao = seleciona variaveis + relacionadas target;
# passo 3: predicao = refina selecao, eliminando redundancia passo 2.
tempo.exec <- system.time(
indic.expand.vsurf <- VSURF(Vtrain[, 1:84], Vtrain[, 85],
                            ntree = ntree, nfor.thres = 50,
                            nfor.interp = 25, nfor.pred = 25,
                            parallel = TRUE, ncores = coresqty)
)
print(tempo.exec)

# GRAFICOS VSURF
plot(indic.expand.vsurf, main = 'VSURF2000 3a.pass - Dataset Vtrain (85v) - 75%')

# print.VSURF (pequena descricao das tres etapas processadas)
indic.expand.vsurf
indic.expand.vsurf$varselect.thres
indic.expand.vsurf$varselect.interp
indic.expand.vsurf$varselect.pred

summary(indic.expand.vsurf)

# melhores variaveis selecionadas pelo VSURF500
best3 <- names(Vtrain[indic.expand.vsurf$varselect.pred])

# PREDICT (essa funcao realiza predicao com novos dados numa RF
# que usa as variaveis selecionadas pelo VSURF)
indic.expand.predictions <- predict(indic.expand.vsurf,
                                    newdata = Vtest[, 1:84])

summary(indic.expand.predictions)
pred.vsurf <- indic.expand.predictions$pred

head(pred.vsurf)
tail(pred.vsurf)

head(Vtest$class)
tail(Vtest$class)

# COMPARANDO VETORES pred.surf (a) x Vtest$class (b)
a <- pred.vsurf
b <- Vtest$class
length(a)
length(b)

identical(a, b)
w <- a == b
head(w, 20)
tail(w, 20)
z <- table(w)['TRUE']
z

acertos.vsurf <- z/length(a)
acertos.vsurf

# matriz de confusao
mat.conf <- table(a, b)
mat.conf

# SALVANDO RESULTADOS DA MODELAGEM
save(list = ls(), file = 'Selection_s.media_expand_rot_3VSURF2000_301121.rdata')
load(file = 'Sel_s.media_expand_rot_3VSURF2000_301121.rdata')
