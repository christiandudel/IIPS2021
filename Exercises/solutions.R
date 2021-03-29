### Solutions to the exercises

# Exercise 1

  1234+1234
  151/7
  13^4 - 12^3 + 5
  20/0
  # Note that the last result (20/0) is 'Inf' which stands for
  # infinity. Mathematically, 20 divided by 0 is not defined and
  # one could expect an error message. However, division by zero
  # returns infinity in many programming language. If you run
  # some long and complicated calculations in R and end up with 'Inf'
  # as a result, then division by zero is a good candidate to check
  # when trying to find the error.


# Exercise 2

  x <- sqrt(2)
  y <- x^2
  y==2
  # R tells us that 2 and y are NOT equal, although they should be.
  # The reason for this is limited accuracy of computers. The square root
  # of 2 is an irrational number, with infintely many, non-repeating 
  # decimal places. This means that you cannot write it down, and computers
  # cannot store it. Because of this, the result of the computation sqrt(2)
  # above is not exactly equal to the real square root of two. 
  # Google 'floating point arithmetics' if you find this interesting.
  

# Exercise 3
  
  # Load data
  file <- "https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/resume.csv"
  experiment <- read.csv(file)
  
  # Look inside
  head(experiment)
  
  # Create table
  tab <- table(experiment$race,
               experiment$call,
               dnn=c("Race","Call"))
  
  # Turn into relative proportions (row-wise)
  prop.table(tab,1)
  
  # Whites are 50% more likely to receive a callback than Blacks
  
  
# Exercise 4
  
  # Loading packages 
  library(MASS)
  library(ggplot2)
  
  # Load data
  data(birthwt)
  
  # Create basic barplot of subjective health
  plot <- ggplot(data=birthwt,
                 mapping=aes(race))+
    geom_bar()
  plot # To look at it
  
  # Nicer version
  plot <- ggplot(data=birthwt,
                 mapping=aes(x=race))+
    geom_bar(stat="count",
             color="black",
             fill="steelblue") +
    labs(x="Ethnicity",y="Absolute counts",
         title="Barplot using birthwt")+
    scale_x_discrete(limits=c("White","Black",
                              "Other"))
  plot
  
  
# Exercise 5
  
  # Function
  mad <- function(x,na.rm=F) {
    
    average <- mean(x,na.rm=na.rm)
    
    result <- abs(x-average)
    result <- mean(result,na.rm=na.rm)
    
    return(result)
    
  }  
  
  # Test cases
  test1 <- 1:10
  test2 <- rnorm(1000)
  test3 <- c(2,5,13,NA,2)
  
  # Results
  mad(test1)
  mad(test2)
  mad(test3)
  mad(test3,na.rm=T)