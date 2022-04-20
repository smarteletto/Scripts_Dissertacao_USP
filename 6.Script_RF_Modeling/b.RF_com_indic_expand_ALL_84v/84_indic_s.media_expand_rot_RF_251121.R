getwd()

rm(list = ls())

### CARGA DO DATASET (indicadores expandidos)
dados <-  read.table('VBASE_indic_s.media_rot_expand_251121.csv',
                                  sep = ',', header = TRUE,
                                  stringsAsFactors = FALSE)
#View(dados)
nrow(dados)
ncol(dados)

indic.expand <- dados
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
atrib.v

## DEFININDO HORIZ = JANELA DESLIZANTE PARA GARANTIR PREVISIBILIDADE
# (nesse caso, NÃO haverá deslocamento pois o mesmo já foi
#  realizado na etapa de rotulagem do dataset base, ou seja,
#  aqui o valor de h assume 1, o que implica em nenhum dia deslocado)
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

## OBS: Lauretto - matriz de confusao rotulados x preditos
table(Vtest$class, predict(RFDef, Xtest))

## GRAFICO DO ERRO OUT-OF-BAG
plot(RFDef)

## INDICE VI (parametro importance = T)
RFDefImp <- randomForest(class ~ ., data = Vtrain, importance = TRUE)
varImpPlot(RFDefImp, type = 1, scale = FALSE,
           n.var = ncol(Vtrain) - 1, cex = 0.8,
           main = "Importancia Variaveis - 84 Indic. Expand. RFpura - 2000T - treino = 75%")

# RESOLVENDO AGLOMERACAO NO EIXO Y - INDICADORES + IMPORTANTES
#sort(RFDefImp$importance, decreasing = TRUE)
RFDefImp$importance
idx.sort <- order(RFDefImp$importance[, "MeanDecreaseAccuracy"], decreasing = TRUE)
idx.sort
#var.imp <- RFDefImp$importance[idx.sort, ]
#var.imp

# DEFININDO INDICADORES A SEREM EXIBIDOS NO GRAFICO (n.var = ?)
RFDefImp <- randomForest(class ~ ., data = Vtrain, importance = TRUE)
varImpPlot(RFDefImp, type = 1, scale = FALSE,
           n.var = 30, cex = 0.8,
           main = "Importancia Variaveis (30) - 84 Indic. Expand. RFpura - 2000T - treino = 75%")

#sort(RFDefImp$importance, decreasing = TRUE)
RFDefImp$importance
idx.sort.84v <- order(RFDefImp$importance[, "MeanDecreaseAccuracy"], decreasing = TRUE)
idx.sort.84v
#var.imp.84v <- RFDefImp$importance[idx.sort.84v, ]
#var.imp.84v
best84 <- names(indic.expand[idx.sort.84v])
best84

dados.imp.var.84expand <- indic.expand[, idx.sort.84v]
nrow(dados.imp.var.84expand)
ncol(dados.imp.var.84expand)
View(dados.imp.var.84expand)

### GRAVANDO DATASET
#my.df.1 <- dados.imp.var.84expand
#f.out.1 <- 'dados.imp.var.84expand_051221.csv'
#write.csv(x = my.df.1, file = f.out.1)

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
