getwd()
rm(list = ls())

### METODO RFE2000T
# vetor de indicadores 1a. passada
r1 <- best1
r1

# vetor de indicadores 2a.passada
r2 <- best2
r2

# vetor de indicadores 3a.passada
r3 <- best3
r3

# vetor de indicadores 4a.passada
r4 <- best4
r4

# vetor de indicadores 5a.passada
r5 <- best5
r5

# SALVANDO RESULTADOS
save(list = ls(), file = 'vetores_indic_RFE2000_051221.rdata')
load(file = 'vetores_indic_RFE2000_051221.rdata')
