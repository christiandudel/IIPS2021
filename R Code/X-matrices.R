### Extra materials: Matrix algebra #################################

### Creating matrices ###############################################

  A <- matrix(c(1,2,3,4),ncol=2,nrow=2)
  A
  class(A)
  
  B <- matrix(c(5,6,7,8),ncol=2,nrow=2)
  B
  
  D <- matrix(1:6,ncol=3)
  D


### Matrix indices ##################################################

  dim(A)
  
  A
  A[2,1] # row and column number
  D
  D[1,3]
  D[1,3] <- 99
  D
  
  D[1,]
  D[,2]
  
  D <- matrix(1:100,ncol=10)
  D[1:5,]
  D[,2:7]
  D[c(1,5,9),]
  D[-c(1,5,9),]    


### Scalar addition/multiplication ##################################

  A+1
  B+15
  
  A*2
  B/20
  
  A^2
  B^3


### Matrix addition #################################################

  A+B # Works
  A-B # Works
  A+D # Error


### Elementwise multiplication ######################################

  A*B # Equivalent to Hadamard product
  A/B  
  B/A  


### Matrix multiplication ###########################################

  A%*%B # Works
  B%*%A # Works
  A%*%D # Works
  D%*%A # Error


### Transpose of matrix #############################################

  t(A)
  t(B)


### Inverse #########################################################

  solve(A)
  solve(B)
  solve(D) # Does not work


### Matrix decompositions ###########################################

  eigen(A)
  
  test <- eigen(A)
  
  test$values
  test$vectors
  
  test$vectors%*%diag(test$values)%*%solve(test$vectors)