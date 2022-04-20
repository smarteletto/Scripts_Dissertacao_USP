# library(randomForest)
# library(class)
# library(igraph)
# library(tidyverse)
# library(RColorBrewer)
# library(viridis)
# library(scales)
# library(ggpubr)

#library(ggplot2)


# rollFun: compute aggregate functions in sliding windows 
#          over a time series
# Implemented by Diethelm Wuertz
rollFun = function(x, lag, FUN, add.na=TRUE, ...) {   

  # Transform:
  x = as.vector(x)

  if (lag==1) {
    return(x)
  } else {
    
    # Roll FUN:
    start = 1
    end = length(x)-lag+1
    m = x[start:end]
    for (i in 2:lag) {
      start = start + 1
      end = end + 1
      m = cbind(m, x[start:end])}
    
    # Result:
    ans = apply(m, MARGIN = 1, FUN = FUN, ...)
    
    if(add.na) {
      ans = c(rep(NA, lag-1), ans)
    }
    
    # Return value:
    return(ans)
  }
}



# Funcoes f1, f2: ruidos de curto e longo prazo
# x: serie de precos (alisada ou nao)
# q: lag
noise = function(x, q) {
  maq = rollFun(x, q, mean, add.na=TRUE)
  
  result = x/maq - 1
  return(result)
}


# Funcoes f3, f4: gradientes de curto e longo prazo
# x: serie de precos (alisada ou nao)
# q: lag
gradient = function(x, q) {
  szx = length(x)
  maq = rollFun(x, q, mean, add.na=TRUE)
  
  result = rep(NA,szx)  
  result[2:szx] = maq[2:szx]/maq[1:(szx-1)] - 1
  return(result)
}

# Funcoes f5, f6: relative high-low position
# x: serie de precos (alisada ou nao)
# q: lag
rhl = function(x, q) {
  szx = length(x)
  maxq = rollFun(x, q, max, add.na=TRUE)
  minq = rollFun(x, q, min, add.na=TRUE)
  
  result = (x - minq)/(maxq-minq)
  return(result)
}


