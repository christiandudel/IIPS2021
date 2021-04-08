### Load packages ###################################################

  library(HMDHFDplus)
  library(tidyverse)

  #us <- "username"
  #pw <- "password"


### Load data #######################################################

  GerPop <- readHMDweb(CNTRY="DEUTNP",
                       item="Exposures_1x1",
                       username=us,
                       password=pw)


### Restrict data ###################################################

  # Last year in data
  max(GerPop$Year)
  
  # Filter data
  GerPop <- GerPop %>% 
            filter(Year==2017) %>% 
            select(Year,Age,Total)


### Aggregate open-ended age category ###############################

  # Starting age of open-ended category
  open <- 85 

  # Replace all ages above 'open' with 'open'
  GerPop <- GerPop %>% 
            mutate(Age=ifelse(Age>=open,open,Age))

  # Aggregate counts
  GerPop <- aggregate(Total~Year+Age,
                      data=GerPop,sum)


### Calculate IFRs ################################################

  # At which point of age interval
  interval <- 0.5 # Set to zero to reproduce Levin et al.
  openinterval <- 7

  # Generate interval variable
  GerPop <- GerPop %>% 
            mutate(Interval=ifelse(Age==open,
                                   openinterval,
                                   interval))
  # ICRs
  GerPop <- GerPop %>% 
            mutate(ICR=  exp(-7.53 + 0.119 * (Age+Interval))/100)


### Scenarios #######################################################

  # Set scenarios
  nopen <- length(65:open)
  scenario1 <- c(rep(0.23,50),rep(0.16,15),rep(0.14,nopen))
  scenario2 <- c(rep(0.20,50),rep(0.20,15),rep(0.20,nopen))
  scenario3 <- c(rep(0.26,50),rep(0.10,15),rep(0.06,nopen))
  
  # Apply to Germany
  GerPop$scenario1 <- scenario1
  GerPop$scenario2 <- scenario2
  GerPop$scenario3 <- scenario3


### Calculate Germany ###############################################

  # Calculate number of cases
  GerPop <- GerPop %>% mutate(Cases1=Total*scenario1) 
  GerPop <- GerPop %>% mutate(Cases2=Total*scenario2) 
  GerPop <- GerPop %>% mutate(Cases3=Total*scenario3) 
  
  # Calculate number of deaths
  GerPop <- GerPop %>% mutate(Deaths1=Cases1*ICR)
  GerPop <- GerPop %>% mutate(Deaths2=Cases2*ICR)
  GerPop <- GerPop %>% mutate(Deaths3=Cases3*ICR)
  
  # Results: IFR by scenario
  sum(GerPop$Deaths1)/sum(GerPop$Cases1) # Scenario 1
  sum(GerPop$Deaths2)/sum(GerPop$Cases2) # Scenario 2
  sum(GerPop$Deaths3)/sum(GerPop$Cases3) # Scenario 3
  