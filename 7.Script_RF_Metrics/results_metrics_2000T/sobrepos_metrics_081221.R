getwd()
rm(list = ls())

library(ggplot2)
library(reshape2)

dados <- read.table('matriz_final_ANOVA.csv', sep = ',',
                    header = TRUE, stringsAsFactors = FALSE)
qtcol <- ncol(dados)
dados <- dados[, -c(1, qtcol)]
nrow(dados)
ncol(dados)
#View(dados)

############################ ACURACIA ##########################
accuracy.12v <- dados[1:1000, 1]
accuracy.84v <- dados[1001:2000, 1]
accuracy.26v <- dados[2001:3000, 1]
accuracy.64v <- dados[3001:4000, 1]

acc <- data.frame(accuracy.12v, accuracy.84v,
                  accuracy.26v, accuracy.64v)
data.acc <- melt(acc)

### ANALISE SOBREPOSICAO ACURACIA
ggplot(data.acc, aes(x=value, fill=variable)) + 
  geom_density(alpha=0.25) + ggtitle('ACURACIA')
ggplot(data.acc, aes(x=value, fill=variable)) + 
  geom_histogram(alpha=0.25) + ggtitle('ACURACIA')
ggplot(data.acc, aes(y=value, fill=variable)) + 
  geom_boxplot() + ggtitle('ACURACIA')

### CALCULO PERCENTIS 5% e 95%
quantile(accuracy.12v, probs = c(0.05, 0.95))
quantile(accuracy.84v, probs = c(0.05, 0.95))
quantile(accuracy.26v, probs = c(0.05, 0.95))
quantile(accuracy.64v, probs = c(0.05, 0.95))

######################## MACRO-F1 ##############################
macro.f1.12v <- dados[1:1000, 2]
macro.f1.84v <- dados[1001:2000, 2]
macro.f1.26v <- dados[2001:3000, 2]
macro.f1.64v <- dados[3001:4000, 2]

macro.f1 <- data.frame(macro.f1.12v, macro.f1.84v,
                  macro.f1.26v, macro.f1.64v)
data.macro.f1 <- melt(macro.f1)

### ANALISE SOBREPOSICAO MACRO-F1
ggplot(data.macro.f1, aes(x=value, fill=variable)) + 
  geom_density(alpha=0.25) + ggtitle('MACRO-F1')
ggplot(data.macro.f1, aes(x=value, fill=variable)) + 
  geom_histogram(alpha=0.25) + ggtitle('MACRO-F1')
ggplot(data.macro.f1, aes(y=value, fill=variable)) + 
  geom_boxplot() + ggtitle('MACRO-F1')

### CALCULO PERCENTIS 5% e 95%
quantile(macro.f1.12v, probs = c(0.05, 0.95))
quantile(macro.f1.84v, probs = c(0.05, 0.95))
quantile(macro.f1.26v, probs = c(0.05, 0.95))
quantile(macro.f1.64v, probs = c(0.05, 0.95))

########################## PONDERADA-F1 #########################
ponderada.f1.12v <- dados[1:1000, 3]
ponderada.f1.84v <- dados[1001:2000, 3]
ponderada.f1.26v <- dados[2001:3000, 3]
ponderada.f1.64v <- dados[3001:4000, 3]

ponderada.f1 <- data.frame(ponderada.f1.12v, ponderada.f1.84v,
                           ponderada.f1.26v, ponderada.f1.64v)
data.ponderada.f1 <- melt(ponderada.f1)

### ANALISE SOBREPOSICAO PONDERADA-F1
ggplot(data.ponderada.f1, aes(x=value, fill=variable)) + 
  geom_density(alpha=0.25) + ggtitle('PONDERADA-F1')
ggplot(data.ponderada.f1, aes(x=value, fill=variable)) + 
  geom_histogram(alpha=0.25) + ggtitle('PONDERADA-F1')
ggplot(data.ponderada.f1, aes(y=value, fill=variable)) + 
  geom_boxplot() + ggtitle('PONDERADA-F1')

### CALCULO PERCENTIS 5% e 95%
quantile(ponderada.f1.12v, probs = c(0.05, 0.95))
quantile(ponderada.f1.84v, probs = c(0.05, 0.95))
quantile(ponderada.f1.26v, probs = c(0.05, 0.95))
quantile(ponderada.f1.64v, probs = c(0.05, 0.95))

########################## MATTHEW COEFIC. #########################
mcc.12v <- dados[1:1000, 4]
mcc.84v <- dados[1001:2000, 4]
mcc.26v <- dados[2001:3000, 4]
mcc.64v <- dados[3001:4000, 4]

mcc <- data.frame(mcc.12v, mcc.84v,
                  mcc.26v, mcc.64v)
data.mcc <- melt(mcc)

### ANALISE SOBREPOSICAO MATTHEW COEFIC.
ggplot(data.mcc, aes(x=value, fill=variable)) + 
  geom_density(alpha=0.25) + ggtitle('MATTHEW COEFIC.')
ggplot(data.mcc, aes(x=value, fill=variable)) + 
  geom_histogram(alpha=0.25) + ggtitle('MATTHEW COEFIC.')
ggplot(data.mcc, aes(y=value, fill=variable)) + 
  geom_boxplot() + ggtitle('MATTHEW COEFIC.')

### CALCULO PERCENTIS 5% e 95%
quantile(mcc.12v, probs = c(0.05, 0.95))
quantile(mcc.84v, probs = c(0.05, 0.95))
quantile(mcc.26v, probs = c(0.05, 0.95))
quantile(mcc.64v, probs = c(0.05, 0.95))

########################## KAPPA COEFIC. #########################
kappa.12v <- dados[1:1000, 5]
kappa.84v <- dados[1001:2000, 5]
kappa.26v <- dados[2001:3000, 5]
kappa.64v <- dados[3001:4000, 5]

kappa <- data.frame(kappa.12v, kappa.84v,
                    kappa.26v, kappa.64v)
data.kappa <- melt(kappa)

### ANALISE SOBREPOSICAO KAPPA COEFIC.
ggplot(data.kappa, aes(x=value, fill=variable)) + 
  geom_density(alpha=0.25) + ggtitle('KAPPA COEFIC.')
ggplot(data.kappa, aes(x=value, fill=variable)) + 
  geom_histogram(alpha=0.25) + ggtitle('KAPPA COEFIC.')
ggplot(data.kappa, aes(y=value, fill=variable)) + 
  geom_boxplot() + ggtitle('KAPPA COEFIC.')

### CALCULO PERCENTIS 5% e 95%
quantile(kappa.12v, probs = c(0.05, 0.95))
quantile(kappa.84v, probs = c(0.05, 0.95))
quantile(kappa.26v, probs = c(0.05, 0.95))
quantile(kappa.64v, probs = c(0.05, 0.95))
