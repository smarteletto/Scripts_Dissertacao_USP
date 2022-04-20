rm(list = ls())

### CONSTRUCAO DATASETS A PARTIR VARIAVEIS SELECIONADAS VSURF500
### BASE
dados.base <- read.table('Vbase_indic_s.media_rot_expand_251121.csv',
                         sep = ',', header = TRUE,
                         stringsAsFactors = FALSE)
View(dados.base)
Vbase <- dados.base
nrow(Vbase)
ncol(Vbase)
#View(Vbase)

# SEPARACAO DAS VARIAVEIS SELECIONADAS PELO VSURF2000 NO DATASET BASE
vbase.26indic.selec.vsurf2000 <- Vbase[indic.expand.vsurf$varselect.pred]
nrow(vbase.26indic.selec.vsurf2000)
ncol(vbase.26indic.selec.vsurf2000)

# VARIAVEL TARGET DO DATASET BASE
vbase.rot <- Vbase[85]

# DATASET BASE - 26 VARIAVEIS SELECIONADAS VSURF2000 + ROTULAGEM
vbase.26.vsurf2000 <- cbind(vbase.26indic.selec.vsurf2000, vbase.rot)
nrow(vbase.26.vsurf2000)
ncol(vbase.26.vsurf2000)
names(vbase.26.vsurf2000)
#View(vbase.26.vsurf2000)

# SALVANDO EM ARQUIVO CSV
my.df.1 <- vbase.26.vsurf2000
f.out.1 <- 'vbase.26.vsurf2000.csv'
write.csv(x = my.df.1, file = f.out.1)
