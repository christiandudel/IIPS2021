### Extra materials: Optimization ###################################

### Probability mass function of binomial ###########################

  # PMF of binomial distribution
  dbinom(x=6, size=10, prob=0.5) 
  # x = positive trials, size = number, prob= probabiltiy
  dbinom(x=0, size=10, prob=0.5)

  
### (Minus) Log-likelihood of binomial ##############################

  # pi= probability value
  # x = positive trials
  # n = total number of trials
  
  loglike.bin <- function(pi, x, n) {
    
    # Minus loglikelihood
    loglike <- -  (x * log(pi) + (n-x) * log(1 - pi))
    
    # Return result
    return(loglike)
    
  }

  
### Plot log likelihood #############################################

  # Range of values
  my.pi <- seq(from=0, to=1, by=0.001)
  
  # Calculate -LL for these values using x=6 and n=10 as an example
  my.loglike <- loglike.bin(my.pi, x=6, n=10)
  
  # Plot results
  plot(my.pi, my.loglike,type="l",xlab="p",ylab="-LL",panel.first=grid())
  
  # Second example with other values
  my.loglike <- loglike.bin(my.pi, x=27, n=100)
  
  # Plot results
  plot(my.pi, my.loglike,type="l",xlab="p",ylab="-LL",panel.first=grid())
  
  # Find lowest value and add to plot
  y1 <- min(my.loglike)
  x1 <- my.pi[which.min(my.loglike)]
  points(x1,y1,pch="X")

  
### Optim function ##################################################

  # Optimize for first example
  optim(par=0.5, fn=loglike.bin, x=6, n=10)
  
  # Get rid of warning
  optim(par = 0.5, fn = loglike.bin, x = 6,
        n = 10, method = "BFGS")
  
  # Save results in object
  estimate <-  optim(par = 0.5, fn = loglike.bin, x = 6,
                     n = 10, method = "BFGS")
  
  names(estimate)
  estimate$par
  
  # Second example
  optim(par = 0.5, fn = loglike.bin, x = 27,
        n = 100, method = "BFGS") # Result is not perfect!
  

### Second example: Poisson #########################################

  # PMF: Pr(X=x|\lambda)=\exp^{-\lambda} * \lambda^x/x!
  # Log-likelihood LL(\lambda|x1,...,xn)=-n\lambda+t log \lambda
  # with t = sum(x)
  # Analytic solution: \lambda=t/n -> mean(x)
  
  loglike.p <- function(lambda,t,n) {
    
    loglike <- n*lambda-t*log(lambda)
    return(loglike)
    
  }
  
  loglike.p(lambda=0.4,n=1000,t=500)
  
  # Plot profile
  my.lambda <- seq(0,10,by=0.01)
  my.loglike <- loglike.p(my.lambda,n=1000,t=500)
  plot(my.lambda,my.loglike,type="l",xlab="Lambda",ylab="-LL",panel.first=grid())
  
  # Analytical solution
  500/1000
  
  # Optim
  optim(par=1,fn=loglike.p,n=1000,t=500)
