# modified function for predicting probs from ERGM
compute_prob <- function(net, coeff) {
  n <- network.size(net)
  form <- as.formula(paste("net ~", paste(names(coeff), collapse = "+"), collapse =" "))
  z <- summary(form)
  result <- matrix(0.0, n, n)
  
  # undirected, upper triangle loop
  for(i in 1:(n-1)) {
    for(j in (i+1):n) {
      net[i,j] <- !net[i,j] # toggle 1 edge
      zAlt <- summary(form)

      # reverse terms to save -1 factor in Anderson et. al.
      if(net[i,j]){
        d <- zAlt - z
      } else {
        d <- z - zAlt
      }
      p <- (1.0 / (1.0 + exp(-sum(coeff * d))))
      result[i,j] <- p # undirected
      result[j,i] <- p
      net[i,j] <- !net[i,j] # restore edge
    }
  }
   return(result)
}