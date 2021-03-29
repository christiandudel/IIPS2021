### Example data ####################################################

  # Package coming with R
  library(MASS)

  # Load data coming with MASS package
  data(birthwt)
  
  # Get help on data
  help(birthwt)
  

### Viewing data ####################################################

  # View data in console
  birthwt
  
  # Class of object
  class(birthwt) 
  
  # Overview of data
  head(birthwt)
  tail(birthwt)
  view(birthwt) # Or click in R Studio under "Environment" tab
  
  # Variable names
  names(birthwt)
  
  # Size of data set
  dim(birthwt)


### View parts of data ##############################################

  # Variable names
  birthwt$bwt # Vector
  birthwt["bwt"] # Data frame


### Descriptive statistics ##########################################

  # Mean
  mean(birthwt$bwt)
  mean(birthwt$age)
  
  # Median
  median(birthwt$bwt)
  median(birthwt$age)
  
  # Standard deviation
  sd(birthwt$bwt)
  sd(birthwt$age)
  
  # Variance
  var(birthwt$bwt)
  var(birthwt$age)
  
  # Quantiles
  quantile(birthwt$bwt)
  quantile(birthwt$age)
  
  # Summary
  summary(birthwt$bwt)
  summary(birthwt)


### Tables ##########################################################

  # Simple tables 
  table(birthwt$age)
  table(birthwt$low)
  
  # Cross tabulations
  table(birthwt$low,birthwt$smoke)
  table(birthwt$low,birthwt$smoke,dnn=c("Low","Smoke"))
  
  # Tables can be stored in objects
  tab <- table(birthwt$low,birthwt$smoke,dnn=c("Low","Smoke"))
  
  # Proportions
  prop.table(tab)
  prop.table(tab,1)
  prop.table(tab,2)


### Another example: German Socio-Economic Panel (GSOEP) ############
  
  # Source: 
  # https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.412698.de/soep_lebensz_en.zip
  # https://www.diw.de/en/diw_02.c.222838.en/soep_in_the_college_classroom.html
  # Download and unzip first
  # Data comes in Stata's dta format
  
  # Load foreign package
  library(foreign)
  
  # Load data
  soep <- read.dta(file="D:/soep_lebensz_en.dta",
                   convert.factors=F)
  
  # Longitudinal data
  head(soep)
  
  # Restrict data to last year
  soep <- subset(x=soep,
                 subset=year==2004)
  
  # Mean satisfaction
  mean(soep$satisf_org)
  
  # Number of kids
  summary(soep$no_kids)
  mean(soep$no_kids)
  
  # Remove missing values (row-wise deletion)
  soep <- na.omit(soep)
  
  # Conditional statistics
  by(data=soep$satisf_org,
     INDICES=soep$no_kids,
     FUN=mean)
  
  # Alternative
  mean(soep$satisf_org[soep$no_kids==1])
  
  
### Reading another data type: CSV ##################################
  
  # Data source and description:
  # https://www.google.com/covid19/mobility/
  
  # Load data 
  covid <- read.csv("D:/Global_Mobility_Report.csv")
  
  # Restrict data to Germany
  covid <- subset(x=covid,
                  subset=country_region=="Germany")
  
  # Restrict data further to Meck-Pomm (where the MPIDR is)
  covid <- subset(x=covid,
                  subset=sub_region_1=="Mecklenburg-Vorpommern")

  # Preview of next session: Plotting (here: base R)
  covid$date <- as.Date(x=covid$date,
                        format="%Y-%m-%d")
  plot(x=covid$date,
       y=covid$transit_stations_percent_change_from_baseline,
       xlab="Date",
       ylab="Percentage change to baseline",
       panel.first=grid(),
       main="Public transportation use",
       type="l")
    