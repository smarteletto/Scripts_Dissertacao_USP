getwd()
rm(list = ls())

library(xlsx)

### METRICAS OBTIDAS COM 26 INDICADORES SELECIONADOS PELO VSURF2000
metrics.vsurf26 <- read.table('BootStrpStats_26VSURF2000_011221.csv',
                            sep = ',', header = TRUE,
                            stringsAsFactors = FALSE)
#View(metrics.vsurf26)

# EXPORTANDO metrics.vsurf26 em PLANILHA EXCEL
my.df.1 <- metrics.vsurf26
f.out.1 <- 'metrics.vsurf26.xlsx'
write.xlsx(x = my.df.1, file = f.out.1, sheetName = 'Projeto SM + ML')

### METRICAS OBTIDAS COM 64 INDICADORES SELECIONADOS PELO RFE2000
metrics.rfe64 <- read.table('BootStrpStats_64RFE2000_021221.csv',
                            sep = ',', header = TRUE,
                            stringsAsFactors = FALSE)
#View(metrics.rfe64)

# EXPORTANDO metrics.rfe64 em PLANILHA EXCEL
my.df.2 <- metrics.rfe64
f.out.2 <- 'metrics.rfe64.xlsx'
write.xlsx(x = my.df.2, file = f.out.2, sheetName = 'Projeto SM + ML')

### METRICAS OBTIDAS COM 84 INDIC. EXPAND. RANKEADOS PELA RFpura
metrics.rfpura84 <- read.table('BootStrpStats_RFpura84_011221.csv',
                            sep = ',', header = TRUE,
                            stringsAsFactors = FALSE)
#View(metrics.rfpura84)

# EXPORTANDO metrics.rfpura84 em PLANILHA EXCEL
my.df.3 <- metrics.rfpura84
f.out.3 <- 'metrics.rfpura84.xlsx'
write.xlsx(x = my.df.3, file = f.out.3, sheetName = 'Projeto SM + ML')

### METRICAS OBTIDAS COM 12 INDIC. TRADIC. RANKEADOS PELA RFpura
metrics.rfpura12 <- read.table('BootStrpStats_RFpura12_011221.csv',
                               sep = ',', header = TRUE,
                               stringsAsFactors = FALSE)
#View(metrics.rfpura12)

# EXPORTANDO metrics.rfpura12 em PLANILHA EXCEL
my.df.4 <- metrics.rfpura12
f.out.4 <- 'metrics.rfpura12.xlsx'
write.xlsx(x = my.df.4, file = f.out.4, sheetName = 'Projeto SM + ML')
