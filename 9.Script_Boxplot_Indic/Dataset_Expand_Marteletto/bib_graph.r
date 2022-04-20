################
#
# bib_graph.r
# 
# Funcoes para plotagem de alguns graficos uteis
#

library(ggplot2)
library(psych)


#
# Funcao para boxplot das distribuicoes dos preditores entre as classes
# Por enquanto, soh serve para um numero moderado de preditores
# 
boxplot_predictors_class = function(df_predictors, vect_class, 
                                    nrow_gr=3, ncol_gr=2, 
                                    filename=NULL) {
  
  #browser()
  nmpred = colnames(df_predictors)
  qtpred = ncol(df_predictors)
  prefpred = formatC(1:qtpred, 
                     width=ceiling(log10(qtpred)), 
                     flag="0")
  nmpred = paste(prefpred, nmpred,sep='_')
  colnames(df_predictors) = nmpred
  
  szdf = nrow(df_predictors)
  
  max_plots_per_graph = nrow_gr*ncol_gr
  
  qtplots = ceiling(qtpred/max_plots_per_graph)
  plots_per_graph = ceiling(qtpred/qtplots)
  
  # nrow_gr = round(sqrt(plots_per_graph))
  # ncol_gr = ceiling(plots_per_graph/nrow_gr)
  # if (nrow_gr<=4) {
  #   ncol_gr = nrow_gr
  # } else {
  #   nrow_gr = 4
  #   ncol_gr = ceiling(plots_per_graph/nrow_gr)
  # }
  
  prefgraf = formatC(1:qtplots, 
                     width=ceiling(log10(qtplots)), 
                     flag="0")
  for (idplot in 1:qtplots) {
    # indices dos preditores a serem plotados no grafico atual
    idxpred = intersect(1:qtpred, (idplot-1)*plots_per_graph + 1:plots_per_graph)
    qtpredplot = length(idxpred)
    
    #browser()
    
    valorespred = c()
    for (i in idxpred) {
      # winsor: trunca valores extremos
      valorespred = c(valorespred, winsor(df_predictors[,i],trim=0.02))
    }
    #browser()
    plot_indic = data.frame(pred=rep(nmpred[idxpred],each=szdf),
                            valores=valorespred, 
                            rotulo=vect_class)
    
    p = ggplot(plot_indic, aes(x=rotulo, y=valores)) +
      geom_boxplot() + #(outlier.shape = NA) +
      facet_wrap(~pred, scales='free', nrow=nrow_gr, ncol=ncol_gr)
    print(p)
  
    #browser()
    
    if (!is.null(filename)) {
      ggsave(paste(prefgraf[idplot],filename,sep='_'), 
             p, width=10, height=2.1*nrow_gr, units='in')
    }  
    
  }  # for (idplot in 1:qtplots)
  
}


#
# Plotagem das series de precos com os rotulos reais e os rotulos preditos
# df_learn deve conter as datas, preco de fechamento, rotulos reais (label)
# e rotulos preditos.
# 
plot_series_labels_class = function (df_learn) {
  
  szdf = nrow(df_learn)
  
  df_learn$labelp = as.factor(Ytest)
  df_learn$labelprev = as.factor(Yprev)
  anos = unique(df_learn$y)
  
  print(table(df_learn$labelp))
  
  classplot = factor(c(-2, -1, 0, 1, 2), levels=c(-2, -1, 0, 1, 2))
  #browser()
  df_learn$labelp[which(!(df_learn$labelp %in% classplot))] = NA
  df_learn$labelprev[which(!(df_learn$labelprev %in% classplot))] = NA
  
  #print(table(df_learn$labelp))
  
  
  
  lwd=0.7
  
  
  ymdfiltant = 0  
  for (ano in anos) {
    for (sem in 1:4) {
      ymdfilt = ano+sem/4
      
      print(ymdfilt)
      
      tipo = 'Classes reais'
      p1 = df_learn %>% 
        filter(ymd>ymdfiltant & ymd<=ymdfilt) %>% 
        ggplot(aes(x=ymd,y=Close)) +
        labs(title=paste(ano, '-', sem, '-', tipo), y="R$", x="Tempo") +
        theme(plot.title = element_text(hjust = 0.5)) + # centraliza o t?tulo
        geom_line(aes(y=Close), col='grey50', lwd=lwd) +
        # scale_color_brewer(type='qual', palette='Set1') +
        geom_point(aes(x=ymd, y=Close, colour=labelp), size=lwd * 2.0) +
        # theme(text=element_text(size=9)) +
        # scale_y_continuous(labels=dollar)
        #scale_colour_hue()
        scale_colour_manual("",
                            breaks=c('-2', '-1', '0', '1', '2'),
                            values=c('darkred', 'orange', 'yellow', 'cyan', 'darkblue'))
      
      tipo = 'Classes preditas'
      p2 = df_learn %>% 
        filter(ymd>ymdfiltant & ymd<=ymdfilt) %>% 
        ggplot(aes(x=ymd,y=Close)) +
        labs(title=paste(ano, '-', sem, '-', tipo), y="R$", x="Tempo") +
        theme(plot.title = element_text(hjust = 0.5)) + # centraliza o t?tulo
        geom_line(aes(y=Close), col='grey50', lwd=lwd) +
        # scale_color_brewer(type='qual', palette='Set1') +
        geom_point(aes(x=ymd, y=Close, colour=labelprev), size=lwd * 2.0) +
        # theme(text=element_text(size=9)) +
        # scale_y_continuous(labels=dollar)
        #scale_colour_hue()
        scale_colour_manual("",
                            breaks=c('-2', '-1', '0', '1', '2'),
                            values=c('darkred', 'orange', 'yellow', 'cyan', 'darkblue'))
      
      
      p3 = ggarrange(p1,p2, ncol=1, nrow=2)
      
      ggsave(
        paste(asset,'_graf_prev_', ano, '_', sem, '.png',sep=''),
        p3, width=11, height=7, units='in')
      # ggsave(
      #   paste(asset,'_graf_prev_', ano, '_', sem, '.png',sep=''),
      #   p3, width=11, height=7, units='in')
      
      ymdfiltant = ymdfilt
    }
  }
  
}


