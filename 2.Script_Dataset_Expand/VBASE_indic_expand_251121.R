rm(list=ls())

source('bib_indicadores.r')

######################## Parametros Iniciais ##########################

j=1         # periodo p/ calculo da media Close (j=1 s/ alisamento)      
qs = 10     # lag de curto prazo para calculo dos indicadores
ql = 50     # lag de longo prazo para calculo dos indicadores


############### Leitura dos Dados e Pre-processamento #################

v = read.table('VBASE_s.media_oscil_volum_rot_251121.csv', 
               header=TRUE, sep=',', stringsAsFactors = FALSE)

nrow(v)
ncol(v)
View(v)
szv = nrow(v) # tamanho da serie original

# Filtragem das colunas dos preditores
# Assumimos que 1a e ultima coluna devem ser tiradas
qtcolv = ncol(v)
vindic = v[,-c(1,qtcolv)]
nrow(vindic)
ncol(vindic)
View(vindic)
qtcolvindic = ncol(vindic)

namesvar = colnames(vindic)

dfcons = vindic

for (idcol in 1:qtcolvindic) {
  vectindic = vindic[,idcol] # vetor com os valores da variavel atual
  varatu = namesvar[idcol] # nome da variavel atual
  print(paste(idcol, varatu, sep=' - '))
  
  # alisamento por media movel simples
  vectalis = rollFun(vectindic, j, mean, add.na=TRUE)
  
  noise_s = noise(x=vectindic, q=qs)
  noise_l = noise(x=vectindic, q=ql)
  grad_s = gradient(x=vectindic, q=qs)
  grad_l = gradient(x=vectindic, q=ql)
  rhl_s = rhl(x=vectindic, q=qs)
  rhl_l = rhl(x=vectindic, q=ql)
  
  dfaux = data.frame(noise_s, noise_l, grad_s, grad_l, rhl_s, rhl_l)
  colnames(dfaux) = paste(varatu, c('Ns','Nl', 'Gs', 'Gl', 'Rs', 'Rl'), sep='.')
  
  dfcons = cbind(dfcons, dfaux)

}

#browser()

nomesindics = colnames(dfcons)
dfcons = cbind(dfcons, v[,qtcolv])
colnames(dfcons) = c(nomesindics, colnames(v)[qtcolv])

dfcons = na.omit(dfcons)
nrow(dfcons)
ncol(dfcons)
View(dfcons)

write.table(dfcons, 'VBASE_indic_s.media_rot_expand_251121.csv', 
            col.names=T, row.names=F, sep=',')
