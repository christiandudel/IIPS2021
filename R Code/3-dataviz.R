### Load ggplot2 ####################################################

  # To learn more about ggplot2: 
  # https://ggplot2.tidyverse.org/

  # If not installed:
  #install.packages("ggplot2")

  # Load the package
  library(ggplot2)


### Basic scatter plot ##############################################

  # Get some data
  library(MASS)
  data(birthwt)

  # Create empty plot
  fig1 <- ggplot(data=birthwt) # Needs to be called
  fig1 # Empty, we need to add geometric objects

  # Ways to add geoms (scatter plot), 1st variant:
  fig1 <- ggplot(data=birthwt)+
          geom_point(aes(x=age,y=bwt))
  fig1

  # Ways to add geoms, 2nd variant
  fig1 <- ggplot(data=birthwt)
  fig1 <- fig1+geom_point(aes(x=age,y=bwt))

  
### Options (examples) ##############################################

  # Labels
  fig1 <- fig1 + labs(x="Age",y="Birth weight")
  fig1
  # Equivalent to
  fig1 <- ggplot(birthwt)+
          geom_point(aes(x=age,y=bwt))+
          labs(x="Age",y="Birth weight")

  # Limits of axes
  fig1 <- fig1+lims(x=c(10,55),y=c(500,5500))

  
### More layers: Smoothing ##########################################
  
  # Adding a smoothing layer
  fig1 <- ggplot(data=birthwt)+
    geom_point(aes(x=age,y=bwt))+
    geom_smooth(aes(x=age,y=bwt))
  fig1

  # As previous example
  fig1 <- ggplot(data=birthwt,mapping=aes(x=age,y=bwt))+
          geom_point()+
          geom_smooth()
  fig1

  # Changing smoothing method
  fig1 <- ggplot(data=birthwt,mapping=aes(x=age,y=bwt))+
          geom_point()+
          geom_smooth(method="lm")
  fig1

  # Some further options
  fig1 <- ggplot(data=birthwt,mapping=aes(x=age,y=bwt))+
          geom_point()+
          geom_smooth(method="lm",se=F,color="red")
  fig1


### Facets ##########################################################
  
  fig1 <- ggplot(data=birthwt)+
          geom_point(aes(x=age,y=bwt))+
          facet_wrap(~smoke)
  fig1

  
### Combination of things ###########################################
  
  fig1 <- ggplot(data=birthwt,mapping=aes(x=age,y=bwt))
  fig1 <- fig1+geom_point()
  fig1 <- fig1+geom_smooth(method="lm",se=F)
  fig1 <- fig1+labs(x="Age",y="Birth weight")
  fig1 <- fig1+facet_wrap(~smoke)
  fig1
  

### Saving ##########################################################
  
  # File extension sets type of graphic (here: pdf)
  ggsave(file="C:/Users/Christian/Desktop/test.pdf",
         plot=fig1)


### Base R plot #####################################################

  # Basic scatter plot
  plot(x=birthwt$age,y=birthwt$bwt)
  
  # Scatter plot with some options
  plot(x=birthwt$age,y=birthwt$bwt,
       main="Scatter plot",
       xlab="Age",
       ylab="Birth weight",
       pch=16,
       cex=1.5,
       col=rgb(0,0,0,alpha=0.5),
       panel.first=grid()) 

  # Saving base R: Devices 
  pdf(file="C:/Graphics/fig1.pdf")
  plot(birthwt$age,birthwt$bwt)
  dev.off()