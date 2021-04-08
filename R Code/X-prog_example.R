### Game of life ####################################################

  # Install simecol
  install.packages("simecol")
  
  # Function
  game_of_life <- function(g=5,steps=25) {
    
    # Load simecol
    library(simecol)
    
    # Create grid    
    G <- sample(0:1,g*g,rep=T)
    G <- matrix(G,nrow=g)
    
    # First plot
    x11()
    image(G,axes=F,col=c("grey60","darkgreen"))
    
    # Simulation steps  
    for(i in 1:steps) {
      
      # Get neighbors
      N <- eightneighbors(G)
      
      # Change states
      G[G==1&!N%in%2:3] <- 0
      G[G==0&N%in%3] <- 1
      
      # Plot
      image(G,axes=F,col=c("grey60","darkgreen"),add=T)
      Sys.sleep(0.15)
      
    }
    
    # Close device
    dev.off()
    
  }
  
  # Examples  
  game_of_life()
  game_of_life(g=50,steps=200)
  game_of_life(g=100,steps=300)

