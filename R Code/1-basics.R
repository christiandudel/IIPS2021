### Lines beginning with an '#' are comments, which are not run 
### To run a line of code in R studio, move courser there and hit Ctrl + Return

### R as calculator #################################################

  1+1 
  2+127
  13-5
  2-99
  3*3
  10/2
  1/0


### Decimal point ###################################################

  1*0.5
  11.23146321+1.24532


### Multiplication first and brackets ###############################

  1+2*3 # Multiplication first
  (1+2)*3 # Brackets


### Powers ##########################################################

  2^2
  2^5
  2^1/3
  2^(1/3)

### Mathematical functions ##########################################

  sqrt(4) # sqrt(a) => a=x^2  
  sqrt(3*3)
  sqrt(2^2)+5
  
  exp(1)
  exp(0)
  
  log(2) # natural log; log_b(a)=> b^x=a with b=e
  log(1)
  
  log(exp(1)) # nested functions


### Arguments of functions ##########################################

  args(log)
  log(2,base=2)  
  log(x=2,base=2)
  # Generally: foo(arg1,arg2,arg3,...)
  log(2,5) # arguments get assigned in order of definition: x, base


### Spacing #########################################################

  sqrt  (     4)
  1 +       1
  sqrt(2)   * 3
  sqrt(
    4)
  
  sq rt(4) # Error
  sqrt(4) exp(5) # Error


### Linebreak #######################################################

  log(
    2)


### R-Studio ########################################################

  # Some nice features:
  # Syntax highlighting
  # Auto-completion, e.g., brackets
  # Hotkeys, e.g. "ALT -" for "<-" 
  # Saving of script files
  # Multiple script files = one R session  

  
### Assignment operator #######################################################

  x <- 5
  x
  y <- 13 # Hotkeys "ALT" + "-" for "<-" 
  y
  x+y # Does not change x or y
  x
  z <- x+y
  z
  sqrt(y)
  x==5
  x==3
  x>y
  
  x+x
  somewhatlongname <- 5
  x.1_12 <- 3  
  
  a<-1
  a< -1
  
  text <- "Hello world!"
  text 
  
  x # Should still be 5
  x <- 1 # x gets replaced without warning
  x