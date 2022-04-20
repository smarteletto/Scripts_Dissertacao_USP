rm(list = ls())

### CONSTRUCAO DATASETS A PARTIR VARIAVEIS SELECIONADAS RFE500
### BASE
dados.base <- read.table('Vbase_indic_s.media_rot_expand_251121.csv',
                         sep = ',', header = TRUE,
                         stringsAsFactors = FALSE)

Vbase <- dados.base
nrow(Vbase)
ncol(Vbase)
#View(Vbase)

# SEPARACAO DAS VARIAVEIS SELECIONADAS PELO RFE500 NO DATASET BASE
vbase.64indic.selec.rfe2000 <- Vbase[rfRFE$optVariables]
nrow(vbase.64indic.selec.rfe2000)
ncol(vbase.64indic.selec.rfe2000)

# VARIAVEL TARGET DO DATASET BASE
vbase.rot <- Vbase[85]

# DATASET BASE - 64 VARIAVEIS SELECIONADAS RFE2000 + ROTULAGEM
vbase.64.rfe2000 <- cbind(vbase.64indic.selec.rfe2000, vbase.rot)
nrow(vbase.64.rfe2000)
ncol(vbase.64.rfe2000)
names(vbase.64.rfe2000)
#View(vbase.64.rfe2000)

# SALVANDO EM ARQUIVO CSV
my.df.1 <- vbase.64.rfe2000
f.out.1 <- 'vbase.64.rfe2000.csv'
write.csv(x = my.df.1, file = f.out.1)
