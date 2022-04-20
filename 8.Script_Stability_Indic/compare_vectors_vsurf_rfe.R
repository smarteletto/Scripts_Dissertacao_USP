getwd()

rm(list = ls())

# OBS: carregar antes arquivo compare_vectors_vsurf_rfe_051221.rdata

################# ANALISE ESTABILIDADE INDICADORES #################
###################### VSURF (20 primeiros) ########################
################## COMPARANDO OS VETORES V1 E V2 ###################
vv1 <- v1[1:20]
vv2 <- v2[1:20]

# os vetores sao iguais?
identical(vv1, vv2)

# quais indicadores sao comuns aos dois vetores?
intersect(vv1, vv2)

# quais indicadores existem em vv1, mas nao em vv2?
setdiff(vv1, vv2)

# quais indicadores existem em vv2, mas nao em vv1?
setdiff(vv2, vv1)

# comparando a posicao de cada indicador nos vetores vv1 e vv2
pos.ind.vv1.vv2 <- vv1 == vv2
table(pos.ind.vv1.vv2)['TRUE']
same.pos.ind.vv1.vv2 <- which(pos.ind.vv1.vv2)
same.pos.ind.vv1.vv2
same.names.ind.vv1.vv2 <- vv1[same.pos.ind.vv1.vv2]
same.names.ind.vv1.vv2

################## COMPARANDO OS VETORES V1 E V3 ###################
vv3 <- v3[1:20]

# os vetores sao iguais?
identical(vv1, vv3)

# quais indicadores sao comuns aos dois vetores?
intersect(vv1, vv3)

# quais indicadores existem em vv1, mas nao em vv3?
setdiff(vv1, vv3)

# quais indicadores existem em vv3, mas nao em vv1?
setdiff(vv3, vv1)

# comparando a posicao de cada indicador nos vetores vv1 e vv3
pos.ind.vv1.vv3 <- vv1 == vv3
table(pos.ind.vv1.vv3)['TRUE']
same.pos.ind.vv1.vv3 <- which(pos.ind.vv1.vv3)
same.pos.ind.vv1.vv3
same.names.ind.vv1.vv3 <- vv1[same.pos.ind.vv1.vv3]
same.names.ind.vv1.vv3

################## COMPARANDO OS VETORES V1 E V4 ###################
vv4 <- v4[1:20]

# os vetores sao iguais?
identical(vv1, vv4)

# quais indicadores sao comuns aos dois vetores?
intersect(vv1, vv4)

# quais indicadores existem em vv1, mas nao em vv4?
setdiff(vv1, vv4)

# quais indicadores existem em vv4, mas nao em vv1?
setdiff(vv4, vv1)

# comparando a posicao de cada indicador nos vetores vv1 e vv4
pos.ind.vv1.vv4 <- vv1 == vv4
table(pos.ind.vv1.vv4)['TRUE']
same.pos.ind.vv1.vv4 <- which(pos.ind.vv1.vv4)
same.pos.ind.vv1.vv4
same.names.ind.vv1.vv4 <- vv1[same.pos.ind.vv1.vv4]
same.names.ind.vv1.vv4

################## COMPARANDO OS VETORES V1 E V5 ###################
vv5 <- v5[1:20]

# os vetores sao iguais?
identical(vv1, vv5)

# quais indicadores sao comuns aos dois vetores?
intersect(vv1, vv5)

# quais indicadores existem em vv1, mas nao em vv5?
setdiff(vv1, vv5)

# quais indicadores existem em vv5, mas nao em vv1?
setdiff(vv5, vv1)

# comparando a posicao de cada indicador nos vetores vv1 e vv5
pos.ind.vv1.vv5 <- vv1 == vv5
table(pos.ind.vv1.vv5)['TRUE']
same.pos.ind.vv1.vv5 <- which(pos.ind.vv1.vv5)
same.pos.ind.vv1.vv5
same.names.ind.vv1.vv5 <- vv1[same.pos.ind.vv1.vv5]
same.names.ind.vv1.vv5


################## COMPARANDO OS VETORES V2 E V3 ###################
# os vetores sao iguais?
identical(vv2, vv3)

# quais indicadores sao comuns aos dois vetores?
intersect(vv2, vv3)

# quais indicadores existem em vv2, mas nao em vv3?
setdiff(vv2, vv3)

# quais indicadores existem em vv3, mas nao em vv2?
setdiff(vv3, vv2)

# comparando a posicao de cada indicador nos vetores vv2 e vv3
pos.ind.vv2.vv3 <- vv2 == vv3
table(pos.ind.vv2.vv3)['TRUE']
same.pos.ind.vv2.vv3 <- which(pos.ind.vv2.vv3)
same.pos.ind.vv2.vv3
same.names.ind.vv2.vv3 <- vv2[same.pos.ind.vv2.vv3]
same.names.ind.vv2.vv3

################## COMPARANDO OS VETORES V2 E V4 ###################
# os vetores sao iguais?
identical(vv2, vv4)

# quais indicadores sao comuns aos dois vetores?
intersect(vv2, vv4)

# quais indicadores existem em vv2, mas nao em vv4?
setdiff(vv2, vv4)

# quais indicadores existem em vv4, mas nao em vv2?
setdiff(vv4, vv2)

# comparando a posicao de cada indicador nos vetores vv2 e vv4
pos.ind.vv2.vv4 <- vv2 == vv4
table(pos.ind.vv2.vv4)['TRUE']
same.pos.ind.vv2.vv4 <- which(pos.ind.vv2.vv4)
same.pos.ind.vv2.vv4
same.names.ind.vv2.vv4 <- vv2[same.pos.ind.vv2.vv4]
same.names.ind.vv2.vv4

################## COMPARANDO OS VETORES V2 E V5 ###################
# os vetores sao iguais?
identical(vv2, vv5)

# quais indicadores sao comuns aos dois vetores?
intersect(vv2, vv5)

# quais indicadores existem em vv2, mas nao em vv5?
setdiff(vv2, vv5)

# quais indicadores existem em vv5, mas nao em vv2?
setdiff(vv5, vv2)

# comparando a posicao de cada indicador nos vetores vv2 e vv5
pos.ind.vv2.vv5 <- vv2 == vv5
table(pos.ind.vv2.vv5)['TRUE']
same.pos.ind.vv2.vv5 <- which(pos.ind.vv2.vv5)
same.pos.ind.vv2.vv5
same.names.ind.vv2.vv5 <- vv2[same.pos.ind.vv2.vv5]
same.names.ind.vv2.vv5


################## COMPARANDO OS VETORES V3 E V4 ###################
# os vetores sao iguais?
identical(vv3, vv4)

# quais indicadores sao comuns aos dois vetores?
intersect(vv3, vv4)

# quais indicadores existem em vv3, mas nao em vv4?
setdiff(vv3, vv4)

# quais indicadores existem em vv4, mas nao em vv3?
setdiff(vv4, vv3)

# comparando a posicao de cada indicador nos vetores vv3 e vv4
pos.ind.vv3.vv4 <- vv3 == vv4
table(pos.ind.vv3.vv4)['TRUE']
same.pos.ind.vv3.vv4 <- which(pos.ind.vv3.vv4)
same.pos.ind.vv3.vv4
same.names.ind.vv3.vv4 <- vv3[same.pos.ind.vv3.vv4]
same.names.ind.vv3.vv4

################## COMPARANDO OS VETORES V3 E V5 ###################
# os vetores sao iguais?
identical(vv3, vv5)

# quais indicadores sao comuns aos dois vetores?
intersect(vv3, vv5)

# quais indicadores existem em vv3, mas nao em vv5?
setdiff(vv3, vv5)

# quais indicadores existem em vv5, mas nao em vv3?
setdiff(vv5, vv3)

# comparando a posicao de cada indicador nos vetores vv3 e vv5
pos.ind.vv3.vv5 <- vv3 == vv5
table(pos.ind.vv3.vv5)['TRUE']
same.pos.ind.vv3.vv5 <- which(pos.ind.vv3.vv5)
same.pos.ind.vv3.vv5
same.names.ind.vv3.vv5 <- vv3[same.pos.ind.vv3.vv5]
same.names.ind.vv3.vv5


################## COMPARANDO OS VETORES V4 E V5 ###################
# os vetores sao iguais?
identical(vv4, vv5)

# quais indicadores sao comuns aos dois vetores?
intersect(vv4, vv5)

# quais indicadores existem em vv4, mas nao em vv5?
setdiff(vv4, vv5)

# quais indicadores existem em vv5, mas nao em vv4?
setdiff(vv5, vv4)

# comparando a posicao de cada indicador nos vetores vv4 e vv5
pos.ind.vv4.vv5 <- vv4 == vv5
table(pos.ind.vv4.vv5)['TRUE']
same.pos.ind.vv4.vv5 <- which(pos.ind.vv4.vv5)
same.pos.ind.vv4.vv5
same.names.ind.vv4.vv5 <- vv4[same.pos.ind.vv4.vv5]
same.names.ind.vv4.vv5

####################################################################
######################### RFE (20 primeiros) #######################
################## COMPARANDO OS VETORES R1 E R2 ###################
rr1 <- r1[1:20]
rr2 <- r2[1:20]

# os vetores sao iguais?
identical(rr1, rr2)

# quais indicadores sao comuns aos dois vetores?
intersect(rr1, rr2)

# quais indicadores existem em rr1, mas nao em rr2?
setdiff(rr1, rr2)

# quais indicadores existem em rr2, mas nao em rr1?
setdiff(rr2, rr1)

# comparando a posicao de cada indicador nos vetores rr1 e rr2
pos.ind.rr1.rr2 <- rr1 == rr2
table(pos.ind.rr1.rr2)['TRUE']
same.pos.ind.rr1.rr2 <- which(pos.ind.rr1.rr2)
same.pos.ind.rr1.rr2
same.names.ind.rr1.rr2 <- rr1[same.pos.ind.rr1.rr2]
same.names.ind.rr1.rr2

################## COMPARANDO OS VETORES R1 E R3 ###################
rr3 <- r3[1:20]

# os vetores sao iguais?
identical(rr1, rr3)

# quais indicadores sao comuns aos dois vetores?
intersect(rr1, rr3)

# quais indicadores existem em rr1, mas nao em rr3?
setdiff(rr1, rr3)

# quais indicadores existem em rr3, mas nao em rr1?
setdiff(rr3, rr1)

# comparando a posicao de cada indicador nos vetores rr1 e rr3
pos.ind.rr1.rr3 <- rr1 == rr3
table(pos.ind.rr1.rr3)['TRUE']
same.pos.ind.rr1.rr3 <- which(pos.ind.rr1.rr3)
same.pos.ind.rr1.rr3
same.names.ind.rr1.rr3 <- rr1[same.pos.ind.rr1.rr3]
same.names.ind.rr1.rr3

################## COMPARANDO OS VETORES R1 E R4 ###################
rr4 <- r4[1:20]

# os vetores sao iguais?
identical(rr1, rr4)

# quais indicadores sao comuns aos dois vetores?
intersect(rr1, rr4)

# quais indicadores existem em rr1, mas nao em rr4?
setdiff(rr1, rr4)

# quais indicadores existem em rr4, mas nao em rr1?
setdiff(rr4, rr1)

# comparando a posicao de cada indicador nos vetores rr1 e rr4
pos.ind.rr1.rr4 <- rr1 == rr4
table(pos.ind.rr1.rr4)['TRUE']
same.pos.ind.rr1.rr4 <- which(pos.ind.rr1.rr4)
same.pos.ind.rr1.rr4
same.names.ind.rr1.rr4 <- rr1[same.pos.ind.rr1.rr4]
same.names.ind.rr1.rr4

################## COMPARANDO OS VETORES R1 E R5 ###################
rr5 <- r5[1:20]

# os vetores sao iguais?
identical(rr1, rr5)

# quais indicadores sao comuns aos dois vetores?
intersect(rr1, rr5)

# quais indicadores existem em rr1, mas nao em rr5?
setdiff(rr1, rr5)

# quais indicadores existem em rr5, mas nao em rr1?
setdiff(rr5, rr1)

# comparando a posicao de cada indicador nos vetores rr1 e rr5
pos.ind.rr1.rr5 <- rr1 == rr5
table(pos.ind.rr1.rr5)['TRUE']
same.pos.ind.rr1.rr5 <- which(pos.ind.rr1.rr5)
same.pos.ind.rr1.rr5
same.names.ind.rr1.rr5 <- rr1[same.pos.ind.rr1.rr5]
same.names.ind.rr1.rr5

################## COMPARANDO OS VETORES R2 E R3 ###################
# os vetores sao iguais?
identical(rr2, rr3)

# quais indicadores sao comuns aos dois vetores?
intersect(rr2, rr3)

# quais indicadores existem em rr2, mas nao em rr3?
setdiff(rr2, rr3)

# quais indicadores existem em rr3, mas nao em rr2?
setdiff(rr3, rr2)

# comparando a posicao de cada indicador nos vetores rr2 e rr3
pos.ind.rr2.rr3 <- rr2 == rr3
table(pos.ind.rr2.rr3)['TRUE']
same.pos.ind.rr2.rr3 <- which(pos.ind.rr2.rr3)
same.pos.ind.rr2.rr3
same.names.ind.rr2.rr3 <- rr2[same.pos.ind.rr2.rr3]
same.names.ind.rr2.rr3

################## COMPARANDO OS VETORES R2 E R4 ###################
# os vetores sao iguais?
identical(rr2, rr4)

# quais indicadores sao comuns aos dois vetores?
intersect(rr2, rr4)

# quais indicadores existem em rr2, mas nao em rr4?
setdiff(rr2, rr4)

# quais indicadores existem em rr4, mas nao em rr2?
setdiff(rr4, rr2)

# comparando a posicao de cada indicador nos vetores rr2 e rr4
pos.ind.rr2.rr4 <- rr2 == rr4
table(pos.ind.rr2.rr4)['TRUE']
same.pos.ind.rr2.rr4 <- which(pos.ind.rr2.rr4)
same.pos.ind.rr2.rr4
same.names.ind.rr2.rr4 <- rr2[same.pos.ind.rr2.rr4]
same.names.ind.rr2.rr4

################## COMPARANDO OS VETORES R2 E R5 ###################
# os vetores sao iguais?
identical(rr2, rr5)

# quais indicadores sao comuns aos dois vetores?
intersect(rr2, rr5)

# quais indicadores existem em rr2, mas nao em rr5?
setdiff(rr2, rr5)

# quais indicadores existem em rr5, mas nao em rr2?
setdiff(rr5, rr2)

# comparando a posicao de cada indicador nos vetores rr2 e rr5
pos.ind.rr2.rr5 <- rr2 == rr5
table(pos.ind.rr2.rr5)['TRUE']
same.pos.ind.rr2.rr5 <- which(pos.ind.rr2.rr5)
same.pos.ind.rr2.rr5
same.names.ind.rr2.rr5 <- rr2[same.pos.ind.rr2.rr5]
same.names.ind.rr2.rr5

################## COMPARANDO OS VETORES R3 E R4 ###################
# os vetores sao iguais?
identical(rr3, rr4)

# quais indicadores sao comuns aos dois vetores?
intersect(rr3, rr4)

# quais indicadores existem em rr3, mas nao em rr4?
setdiff(rr3, rr4)

# quais indicadores existem em rr4, mas nao em rr3?
setdiff(rr4, rr3)

# comparando a posicao de cada indicador nos vetores rr3 e rr4
pos.ind.rr3.rr4 <- rr3 == rr4
table(pos.ind.rr3.rr4)['TRUE']
same.pos.ind.rr3.rr4 <- which(pos.ind.rr3.rr4)
same.pos.ind.rr3.rr4
same.names.ind.rr3.rr4 <- rr3[same.pos.ind.rr3.rr4]
same.names.ind.rr3.rr4

################## COMPARANDO OS VETORES R3 E R5 ###################
# os vetores sao iguais?
identical(rr3, rr5)

# quais indicadores sao comuns aos dois vetores?
intersect(rr3, rr5)

# quais indicadores existem em rr3, mas nao em rr5?
setdiff(rr3, rr5)

# quais indicadores existem em rr5, mas nao em rr3?
setdiff(rr5, rr3)

# comparando a posicao de cada indicador nos vetores rr3 e rr5
pos.ind.rr3.rr5 <- rr3 == rr5
table(pos.ind.rr3.rr5)['TRUE']
same.pos.ind.rr3.rr5 <- which(pos.ind.rr3.rr5)
same.pos.ind.rr3.rr5
same.names.ind.rr3.rr5 <- rr3[same.pos.ind.rr3.rr5]
same.names.ind.rr3.rr5

################## COMPARANDO OS VETORES R4 E R5 ###################
# os vetores sao iguais?
identical(rr4, rr5)

# quais indicadores sao comuns aos dois vetores?
intersect(rr4, rr5)

# quais indicadores existem em rr4, mas nao em rr5?
setdiff(rr4, rr5)

# quais indicadores existem em rr5, mas nao em rr4?
setdiff(rr5, rr4)

# comparando a posicao de cada indicador nos vetores rr4 e rr5
pos.ind.rr4.rr5 <- rr4 == rr5
table(pos.ind.rr4.rr5)['TRUE']
same.pos.ind.rr4.rr5 <- which(pos.ind.rr4.rr5)
same.pos.ind.rr4.rr5
same.names.ind.rr4.rr5 <- rr4[same.pos.ind.rr4.rr5]
same.names.ind.rr4.rr5

############### COMPARACAO INTRA-METODO 1 VSURF ####################
### analise preliminar VSURF - 3a.passada (mediana) x demais
vv3
identical(vv1, vv3)
intersect(vv1, vv3)
setdiff(vv1, vv3)
setdiff(vv3, vv1)
same.pos.ind.vv1.vv3
vv3
identical(vv2, vv3)
intersect(vv2, vv3)
setdiff(vv2, vv3)
setdiff(vv3, vv2)
same.pos.ind.vv2.vv3
vv3
identical(vv3, vv4)
intersect(vv3, vv4)
setdiff(vv3, vv4)
setdiff(vv4, vv3)
same.pos.ind.vv3.vv4
vv3
identical(vv3, vv5)
intersect(vv3, vv5)
setdiff(vv3, vv5)
setdiff(vv5, vv3)
same.pos.ind.vv3.vv5


################ COMPARACAO INTRA-METODO 2 RFE ####################
### analise preliminar RFE - 4a.passada (mediana) x demais
rr4
identical(rr1, rr4)
intersect(rr1, rr4)
setdiff(rr1, rr4)
setdiff(rr4, rr1)
same.pos.ind.rr1.rr4
rr4
identical(rr2, rr4)
intersect(rr2, rr4)
setdiff(rr2, rr4)
setdiff(rr4, rr2)
same.pos.ind.rr2.rr4
rr4
identical(rr3, rr4)
intersect(rr3, rr4)
setdiff(rr3, rr4)
setdiff(rr4, rr3)
same.pos.ind.rr3.rr4
rr4
identical(rr4, rr5)
intersect(rr4, rr5)
setdiff(rr4, rr5)
setdiff(rr5, rr4)
same.pos.ind.rr4.rr5

############## COMPARACAO ENTRE-METODOS VSURF x RFE ###############
### analise preliminar VSURF (26) x RFE (64) - medianas
vv3
rr4
identical(vv3, rr4)
intersect(vv3, rr4)
setdiff(vv3, rr4)
setdiff(rr4, vv3)
pos.ind.vv3.rr4 <- vv3 == rr4
table(pos.ind.vv3.rr4)['TRUE']
same.pos.ind.vv3.rr4 <- which(pos.ind.vv3.rr4)
same.pos.ind.vv3.rr4
same.names.ind.vv3.rr4 <- vv3[same.pos.ind.vv3.rr4]
same.names.ind.vv3.rr4

###################### COMPOSICAO SCORE ########################
v3
r4
match(setdiff(vv3, rr4), r4)
match(setdiff(rr4, vv3), v3)

### SALVANDO RESULTADOS
save(list = ls(), file = 'compare_vectors_vsurf_rfe_051221.rdata')
load(file = 'compare_vectors_vsurf_rfe_051221.rdata')
