### Pipes ###########################################################

  # Load data
  library(MASS)
  data(birthwt)
  
  # Making a table - variant 1
  prop.table(table(birthwt$smoke))
  
  # Making a table - variant 2
  tab1 <- table(birthwt$smoke)
  prop.table(tab1)
  
  # Using pipes
  library(tidyverse) # or magrittr
  birthwt$smoke %>% table %>% prop.table
  
  # object %>% foo
  # is equivalent to
  # foo(object)
  

### Data editing, first example #####################################
  
  # Outlier?
  birthwt %>% ggplot(aes(x=age,y=bwt))+
              geom_point()+
              geom_smooth(method="lm")
  
  # Filtering
  birthwt %>% filter(age<40) %>% 
              ggplot(aes(x=age,y=bwt))+
              geom_point()+
              geom_smooth(method="lm")
  
  # Removing from data
  summary(birthwt$age) # Age above 40 is still there
  birthwt <- birthwt %>% filter(age<40)
  summary(birthwt$age) # Now removed from data
  data(birthwt) # Reloading data
  summary(birthwt$age) # There again
  
  # Missing values
  birthwt <- birthwt %>% mutate(age=na_if(age,45))
  summary(birthwt$age)
  
  # Careful with missing values!
  mean(birthwt$age)
  mean(birthwt$age,na.rm=T)
  
  # Creating new variables (1st example)
  birthwt <- birthwt %>% mutate(low=as.numeric(bwt<2500))
  birthwt$low %>% table %>% prop.table
  
  # Recoding variable
  birthwt$low <- recode(birthwt$low,'0'="Normal",'1'="Low")
  birthwt$low %>% table %>% prop.table
  
  # Creating new variables (2nd example)
  birthwt <- birthwt %>% mutate(agesquared=age^2)


### Second example, also extending ggplot2 ##########################
  
  # What we want to look at (for selected countries):
  # https://ourworldindata.org/grapher/daily-covid-deaths-per-million-7-day-average
  
  # What the raw data looks like:
  # https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv
  
  # Load many libraries at once
  library(tidyverse)
  
  # Load data
  datapath <- "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv"
  covid <- read_csv(datapath)
  
  # Look at data
  covid
  view(covid)
  
  # Check countries in data
  covid %>% pull(location) %>% unique()
  
  # Edit data: Restrict variables
  covid <- covid %>% select(location,
                            date,
                            total_deaths_per_million)
  
  # Edit data: Change variable names
  covid <- covid %>% rename(Country=location,
                            Date=date,
                            Deaths=total_deaths_per_million)
  
  # Edit data: Select countries
  countrylist <- c("Germany","India","United States","Taiwan")
  covid <- covid %>% filter(Country%in%countrylist)
  
  # Edit data: Select dates since February 2020
  class(covid$Date) # Check that it is really a date
  range(covid$Date) # Earliest and latest date
  covid <- covid %>% filter(Date>="2020-02-01")
  
  # Start plotting
  fig1 <-  ggplot(data=covid,
                  mapping=aes(x=Date,y=Deaths,color=Country))+
           geom_line()
  fig1
  
  # Polsih some more
  cols <- c("#2ca25f",
            "#f0027f",
            "#beaed4",
            "#fdc086")
  fig1 <- ggplot(data=covid,
                 mapping=aes(x=Date,y=Deaths,color=Country))+ 
    geom_line(size=1)+
    labs(x="Date",
         y="Deaths/million",
         title="COVID-19 deaths per million inhabitants",
         subtitle="February 2020-April 2021",
         caption="Source: OWID")+
    scale_colour_manual(values = cols)+
    theme_bw()
  fig1
  
  