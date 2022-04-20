getwd()

# OBS: carregar antes arquivo match_indic_rfe_051121.rdata

# analise estabilidade RFE com base no 4a.passada (mediana)
rr4

match('PriceCl.Rl', rr1)
match('PriceCl.Rl', rr2)
match('PriceCl.Rl', rr3)
match('PriceCl.Rl', rr5)

match('PriceCl.Nl', rr1)
match('PriceCl.Nl', rr2)
match('PriceCl.Nl', rr3)
match('PriceCl.Nl', rr5)

match('RSI', rr1)
match('RSI', rr2)
match('RSI', rr3)
match('RSI', rr5)

match('PriceCl.Gl', rr1)
match('PriceCl.Gl', rr2)
match('PriceCl.Gl', rr3)
match('PriceCl.Gl', rr5)

match('ClxVWAP20', rr1)
match('ClxVWAP20', rr2)
match('ClxVWAP20', rr3)
match('ClxVWAP20', rr5)

match('ClxVWAP20.Ns', rr1)
match('ClxVWAP20.Ns', rr2)
match('ClxVWAP20.Ns', rr3)
match('ClxVWAP20.Ns', rr5)

match('CCI', rr1)
match('CCI', rr2)
match('CCI', rr3)
match('CCI', rr5)

match('ClxBB.Ns', rr1)
match('ClxBB.Ns', rr2)
match('ClxBB.Ns', rr3)
match('ClxBB.Ns', rr5)

match('ClxBB', rr1)
match('ClxBB', rr2)
match('ClxBB', rr3)
match('ClxBB', rr5)

match('CCI.Ns', rr1)
match('CCI.Ns', rr2)
match('CCI.Ns', rr3)
match('CCI.Ns', rr5)

match('RSI.Nl', rr1)
match('RSI.Nl', rr2)
match('RSI.Nl', rr3)
match('RSI.Nl', rr5)

match('pnADX.Gs', rr1)
match('pnADX.Gs', rr2)
match('pnADX.Gs', rr3)
match('pnADX.Gs', rr5)

match('RSI.Rl', rr1)
match('RSI.Rl', rr2)
match('RSI.Rl', rr3)
match('RSI.Rl', rr5)

match('pnADX.Rl', rr1)
match('pnADX.Rl', rr2)
match('pnADX.Rl', rr3)
match('pnADX.Rl', rr5)

match('pnADX.Ns', rr1)
match('pnADX.Ns', rr2)
match('pnADX.Ns', rr3)
match('pnADX.Ns', rr5)

match('ClxVWAP20.Nl', rr1)
match('ClxVWAP20.Nl', rr2)
match('ClxVWAP20.Nl', rr3)
match('ClxVWAP20.Nl', rr5)

match('ClxVWAP20.Rl', rr1)
match('ClxVWAP20.Rl', rr2)
match('ClxVWAP20.Rl', rr3)
match('ClxVWAP20.Rl', rr5)

match('pnADX', rr1)
match('pnADX', rr2)
match('pnADX', rr3)
match('pnADX', rr5)

match('RSI.Ns', rr1)
match('RSI.Ns', rr2)
match('RSI.Ns', rr3)
match('RSI.Ns', rr5)

match('MACD', rr1)
match('MACD', rr2)
match('MACD', rr3)
match('MACD', rr5)

rr4

# SALVANDO RESULTADOS
save(list = ls(), file = 'match_indic_rfe_051221.rdata')
load(file = 'match_indic_rfe_051221.rdata')
