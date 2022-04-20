getwd()
rm(list = ls())

# CONTROLE RFpura12
m.RFpura12 <- read.table('Matriz_Metricas_RFpura12_011221.csv',
                          sep = ',', header = TRUE,
                          stringsAsFactors = FALSE)

metricas.RFpura12 <- m.RFpura12[, -c(1)]

# CONTROLE RFpura84
m.RFpura84 <- read.table('Matriz_Metricas_RFpura84_011221.csv',
                          sep = ',', header = TRUE,
                          stringsAsFactors = FALSE)

metricas.RFpura84 <- m.RFpura84[, -c(1)]

# METODO VSURF2000
m.26VSURF2000 <- read.table('Matriz_Metricas_26VSURF2000_011221.csv',
                             sep = ',', header = TRUE,
                             stringsAsFactors = FALSE)

metricas.26VSURF2000 <- m.26VSURF2000[, -c(1)]

# METODO RFE2000
m.64RFE2000 <- read.table('Matriz_Metricas_64RFE2000_021221.csv',
                           sep = ',', header = TRUE,
                           stringsAsFactors = FALSE)

metricas.64RFE2000 <- m.64RFE2000[, -c(1)]

# CONSOLIDANDO AS METRICAS DE CADA METODO
matriz.final <- rbind(metricas.RFpura12, metricas.RFpura84,
                      metricas.26VSURF2000, metricas.64RFE2000)

# ROTULANDO COLUNA METHOD
matriz.final$Method <- NULL
matriz.final$Method[1:1000] <- c('A')
matriz.final$Method[1001:2000] <- c('B')
matriz.final$Method[2001:3000] <- c('C')
matriz.final$Method[3001:4000] <- c('D')

View(matriz.final)

# EXPORTANDO MATRIZ METRICAS PARA ANOVA
my.df.1 <- matriz.final
f.out.1 <- 'matriz_final_ANOVA.csv'
write.csv(x = my.df.1, file = f.out.1)

my.df.2 <- matriz.final
f.out.2 <- 'matriz.final.ANOVA.xlsx'
write.xlsx(x = my.df.1, file = f.out.1, sheetName = 'Projeto SM + ML')