getwd()

library(magrittr)

rm(list = ls())

### CARGA DO DATASET
dados <-  read.table('VBASE_indic_s.media_rot_expand_251121.csv', sep = ',', 
                     header = TRUE, stringsAsFactors = FALSE)

## PREPARANDO DATASET PARA SPLIT
indic.expand <- dados
nrow(indic.expand)
ncol(indic.expand)
#View(indic.expand)

## DEFININDO VARIAVEIS PREDITORAS
colunas.dados <- ncol(dados)
var.predit <- dados[,-c(colunas.dados)]
nrow(var.predit)
ncol(var.predit)
#View(var.predit)
namesvar = colnames(var.predit)
atrib <- namesvar
atrib

## DEFININDO VARIAVEL TARGET COMO FATOR
indic.expand$RotGer <- as.factor(indic.expand$RotGer)

## DIVISAO DATASET em TREINAMENTO e TESTE
szv <- nrow(indic.expand)
szvtrain <- floor(szv*0.75)
ajuste <- 1 # ajuste = para acertar divisao treino/teste, ja que
            # houve arredondamento para baixo no szvtrain (floor)
idxtrain <- 1:szvtrain
idxtest <- (szvtrain + ajuste):szv

vtrain <- indic.expand[idxtrain, ]
sztrain <- nrow(vtrain)
vtest <- indic.expand[idxtest, ]
sztest <- nrow(vtest)

## TREINAMENTO
Xtrain <- vtrain[, atrib]
nrow(Xtrain)
ncol(Xtrain)
#View(Xtrain)
Vtrain <- data.frame(Xtrain[,], class = vtrain$RotGer)
nrow(Vtrain)
ncol(Vtrain)
#View(Vtrain)

## TESTE
Xtest <- vtest[, atrib]
nrow(Xtest)
ncol(Xtest)
#View(Xtest)
Vtest <- data.frame(Xtest[,], class = vtest$RotGer)
nrow(Vtest)
ncol(Vtest)
#View(Vtest)

# AVALIANDO BALANCEAMENTO DE CLASSES - GLOBAL, TREINO e TESTE
# global
nrow(indic.expand)
ncol(indic.expand)
balanc.global <- table(indic.expand$RotGer)
balanc.global %>% divide_by(nrow(indic.expand))

# treino
nrow(Vtrain)
ncol(Vtrain)
balanc.treino <- table(Vtrain$class)
balanc.treino %>% divide_by(nrow(Vtrain))

# teste
nrow(Vtest)
ncol(Vtest)
balanc.teste <- table(Vtest$class)
balanc.teste %>% divide_by(nrow(Vtest))

### EXPORTANDO DATASETS
my.df.1 <- Vtrain
f.out.1 <- 'Vtrain_s.media_expand_rot_251121.csv'
write.csv(x = my.df.1, file = f.out.1)

my.df.2 <- Xtest
f.out.2 <- 'Xtest_s.media_expand_rot_251121.csv'
write.csv(x = my.df.2, file = f.out.2)

my.df.3 <- Vtest
f.out.3 <- 'Vtest_s.media_expand_rot_251121.csv'
write.csv(x = my.df.3, file = f.out.3)
