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
  
  
# Exercise 6
  
  # Load library
  library(HMDHFDplus)
  
  # Needed for HMDHFDplus
  #pw <- "password" # Put your HMD password here
  #us <- "username" # Put your HMD username here
  
  # Load Swedish data
  e0swe <- readHMDweb(CNTRY="SWE",item="E0per",
                      username=us,password=pw)
  
  # Plot using ggplot
  ggplot(data=e0swe)+
    geom_line(aes(x=Year,y=Women,color="red"))+
    geom_line(aes(x=Year,y=Men,color="blue"))+
    labs(x="Year",y="e0",
         title="Life expectancy in Sweden",
         caption="Source: HMD")+
    scale_color_manual(labels=c("Men", "Women"), 
                       values = c("blue", "red"),
                       name="Gender")
  
  # Calculate gender gap
  e0swe <- e0swe %>% mutate(gendergap=Female-Male)
  
  # Plot using base R
  plot(e0swe$Year,e0swe$gendergap,type="l",
       xlab="Year",ylab="Female e0-male e0",
       panel.first=grid(),col="red",
       main="Gender gap in life expectancy in Sweden",
       ylim=c(-1,7))
  abline(h=0)
  # I include the range from -1 to 7 for the y-axis in the plot
  # as this allows to include a reference line at zero.
  # For values below that line males are doing better and
  # values above the reference line mean that women are doing better.
  # This makes reading the figure a bit easier: You can immediately see
  # that women in Sweden have always been doing better than men