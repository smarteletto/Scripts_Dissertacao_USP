#
# Geracao de boxplots para um conjunto de preditores em relacao aas classes
#

rm(list=ls())

source('bib_graph.r')

dfdados = read.table('VBASE_indic_s.media_rot_expand_251121.csv',
                     header=T, sep=',')

nomes_preditores = c("PriceCl.Nl","PriceCl.Rl","RSI",
                     "ClxVWAP20","PriceCl.Gl","ClxBB",
                     "ClxVWAP20.Ns","RSI.Nl","RSI.Rl",
                     "pnADX.Rl","pnADX","ClxVWAP20.Rl",
                     "ClxVWAP20.Nl","RSI.Ns","MACD")
nome_classe = 'RotGer'

X = dfdados[,nomes_preditores]
y = factor(dfdados[,nome_classe], levels=c(-1,0,1))

boxplot_predictors_class(X, y, 
                         nrow_gr=4, ncol_gr=4,
                         filename='BoxPlots.png')
  
# NOMES ATRIBUTOS
#c("PriceCl.Nl","PriceCl.Rl","RSI",
#"ClxVWAP20","PriceCl.Gl","ClxBB",
#"ClxVWAP20.Ns","RSI.Nl","RSI.Rl",
#"pnADX.Rl","pnADX","ClxVWAP20.Rl",
#"ClxVWAP20.Nl","RSI.Ns","MACD")
