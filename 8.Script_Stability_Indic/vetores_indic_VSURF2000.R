getwd()
rm(list = ls())

### METODO VSURF2000T
# vetor de indicadores 1a. passada
v1 <- best1
v1

# vetor de indicadores 2a.passada
v2 <- best2
v2

# vetor de indicadores 3a.passada
v3 <- best3
v3
  
# vetor de indicadores 4a.passada
v4 <- best4
v4

# vetor de indicadores 5a.passada
v5 <- best5
v5

# SALVANDO RESULTADOS
save(list = ls(), file = 'vetores_indic_VSURF2000_051221.rdata')
load(file = 'vetores_indic_VSURF2000_051221.rdata')
