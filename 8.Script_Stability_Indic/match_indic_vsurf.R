getwd()

# OBS: carregar antes arquivo match_indic_vsurf_051121.rdata

# analise estabilidade VSURF com base no 3a.passada (mediana)
vv3

match('PriceCl.Nl', vv1)
match('PriceCl.Nl', vv2)
match('PriceCl.Nl', vv4)
match('PriceCl.Nl', vv5)

match('PriceCl.Rl', vv1)
match('PriceCl.Rl', vv2)
match('PriceCl.Rl', vv4)
match('PriceCl.Rl', vv5)

match('RSI', vv1)
match('RSI', vv2)
match('RSI', vv4)
match('RSI', vv5)

match('ClxVWAP20', vv1)
match('ClxVWAP20', vv2)
match('ClxVWAP20', vv4)
match('ClxVWAP20', vv5)

match('RSI.Rl', vv1)
match('RSI.Rl', vv2)
match('RSI.Rl', vv4)
match('RSI.Rl', vv5)

match('RSI.Nl', vv1)
match('RSI.Nl', vv2)
match('RSI.Nl', vv4)
match('RSI.Nl', vv5)

match('PriceCl.Gl', vv1)
match('PriceCl.Gl', vv2)
match('PriceCl.Gl', vv4)
match('PriceCl.Gl', vv5)

match('pnADX', vv1)
match('pnADX', vv2)
match('pnADX', vv4)
match('pnADX', vv5)

match('ClxVWAP20.Ns', vv1)
match('ClxVWAP20.Ns', vv2)
match('ClxVWAP20.Ns', vv4)
match('ClxVWAP20.Ns', vv5)

match('RSI.Gl', vv1)
match('RSI.Gl', vv2)
match('RSI.Gl', vv4)
match('RSI.Gl', vv5)

match('pnADX.Rl', vv1)
match('pnADX.Rl', vv2)
match('pnADX.Rl', vv4)
match('pnADX.Rl', vv5)

match('ClxVWAP20.Rl', vv1)
match('ClxVWAP20.Rl', vv2)
match('ClxVWAP20.Rl', vv4)
match('ClxVWAP20.Rl', vv5)

match('PriceCl.Ns', vv1)
match('PriceCl.Ns', vv2)
match('PriceCl.Ns', vv4)
match('PriceCl.Ns', vv5)

match('ClxBB.Rl', vv1)
match('ClxBB.Rl', vv2)
match('ClxBB.Rl', vv4)
match('ClxBB.Rl', vv5)

match('AD.Nl', vv1)
match('AD.Nl', vv2)
match('AD.Nl', vv4)
match('AD.Nl', vv5)

match('ClxVWAP20.Nl', vv1)
match('ClxVWAP20.Nl', vv2)
match('ClxVWAP20.Nl', vv4)
match('ClxVWAP20.Nl', vv5)

match('RSI.Ns', vv1)
match('RSI.Ns', vv2)
match('RSI.Ns', vv4)
match('RSI.Ns', vv5)

match('ClxSAR.Rs', vv1)
match('ClxSAR.Rs', vv2)
match('ClxSAR.Rs', vv4)
match('ClxSAR.Rs', vv5)

match('MACD', vv1)
match('MACD', vv2)
match('MACD', vv4)
match('MACD', vv5)

vv3

# SALVANDO RESULTADOS
save(list = ls(), file = 'match_indic_vsurf_051221.rdata')
load(file = 'match_indic_vsurf_051221.rdata')