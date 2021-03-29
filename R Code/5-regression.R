### Load data #######################################################

  # Birth weight data as example
  library(MASS)
  data(birthwt)

  
### Linear regression ###############################################

  # Birth weight as dependet variable, age and smoking dummy as
  # independent variables
  lm(bwt~age+smoke,data=birthwt)
  
  # Store in object for later use
  fit1 <- lm(formula=bwt~age+smoke,
             data=birthwt)
  
  # Overview of results
  summary(fit1)  
  
  # Coefficients
  coef(fit1)  
  
  # Confidence intervals
  confint(fit1)
  
  # Var-Cov-Matrix
  vcov(fit1)
  
  
### Dummies, non-linear variables, interactions #####################
  
  # Adding squared variable
  birthwt$agesquared <- birthwt$age^2
  fit2 <- lm(bwt~age+agesquared+smoke,data=birthwt)
  summary(fit2)
  
  # Adding factors for dummy variables
  birthwt$race <- factor(birthwt$race,
                         levels=1:3,
                         labels=c("white","black","other"))
  birthwt$smoke <- factor(birthwt$smoke,
                          levels=0:1,
                          labels=c("Non-smoker","smoker"))
  
  fit3 <- lm(bwt~age+agesquared+smoke+race,data=birthwt)
  summary(fit3)
  
  # Interaction
  fit4 <- lm(bwt~age+agesquared+smoke+race+smoke*race,data=birthwt)
  summary(fit4)
  
  
### Logistic regression #############################################
  
  # Fit logistic regression
  fit5 <- glm(formula=low~age+smoke,
              data=birthwt,
              family=binomial)
  
  # Summary, coefficients, conf intervals
  summary(fit5)
  coef(fit5)
  confint(fit5)
  
  # Predict probabilities for individual
  predict(fit5,type="response")
  
  # Marginal effects
  # install.packages("margins")
  library(margins)
  margins(fit5)
  
  # Linear probability model for comparison
  fit6 <- lm(formula=low~age+smoke,
              data=birthwt)
  coef(fit6)
  
  # Robust standard errors for LPM
  library(sandwich)
  library(lmtest)
  coeftest(fit6,sandwich)
  