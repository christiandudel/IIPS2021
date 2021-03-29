### Functions #######################################################

  # Basic example
  add <- function(a,b) {
    a+b
  }
  
  # What did the last call do?
  ls()
  add
  class(add)
  
  # Using the function
  add(1,2)
  add(3,5)
  add(a=3,b=5)
  
  # More complex example
  addsum <- function(x) {
    
    number <- 0
    
    for(j in 1:x) {
      
      number <- number + j
      
    }
    
    return(number)  
    
  }
  
  addsum(11)
  
  # More efficient alternative
  addsum(10)
  sum(1:10)  


### for-loops #######################################################

  # Example 1
  number <- 0 # For result
  
  for(j in 1:10) {
    
    number <- number + j
    
  }
  
  number
  
  # Example 2
  values <- c(2,3,4,7,9) 
  
  number <- 0
  
  for(i in values) {
    
    number <- number + i
    
  }
  
  number


### Nested loops ####################################################

  numbers <- NULL
  
  for(i in 1:10) {
    
    numbers[i] <- 0
    
    for(j in 1:i) {
      numbers[i] <- numbers[i]+j
    }
    
  }
  
  numbers


### Random numbers ##################################################

  # Uniform distribution
  runif(5)
  runif(5)
  runif(5)
  runif(10)
  
  test1 <- runif(100)
  summary(test1)
  
  test2 <- runif(100,min=-1,max=1)
  summary(test2)
  
  # Normal distribution
  rnorm(10)
  rnorm(10,mean=2,sd=5)


### Simple example combining a few things ###########################

  random.walk <- function(steps,start=0) {
    
    path <- runif(n=steps,min=-1,max=1)
    
    start+cumsum(path)
    
  }
  
  random.walk(steps=1000)
  
  result <- random.walk(steps=1000)
  plot(result,type="l")
  
  result <- random.walk(steps=100,start=10)
  plot(result,type="l")
