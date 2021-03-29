# Exercises

Below you find some (voluntary) exercises which you can solve. Solutions for the exercises can also be found in this folder. Install R and R Studio if you haven't done so already:

* R https://cloud.r-project.org/
* RStudio https://rstudio.com/products/rstudio/ 
    
### Exercise 1
Create an R script using R Studio which runs the following calculations:

* 1234+1234
* 151/7
* 13^4 - 12^3 + 5
* 20/0

### Exercise 2
Create an R script using R Studio which, first, creates an object 'x' which contains the result of <img src="https://render.githubusercontent.com/render/math?math=\sqrt{2}">. Create a second object 'y' which is equal to x^2. Finally, check whether y is equal to 2 using the == operator. Comment on the result (in the script file) - did you expect it?

### Exercise 3

In a much cited experiment Bertrand and Mullainathan (2004) showed that African Americans were less likely to receive a callback after applying to help-wanted ads, even if the resumes were identical. The authors achieved this by sending the same, fictiuous application many times and only randomly changing the name of the fictious applicant, sometimes using African-American- and sometimes White-sounding names. You can find the paper here (access through your MPIDR/university account): https://www.aeaweb.org/articles?id=10.1257/0002828042002561

A part of the data has been published with a textbook on quantitative social science by Kosuke Imai. The data is available on Imai's GitHub: https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/resume.csv
  
Load the data set and create a cross-tablulation of the two variables 'race' and 'call'. To load the data you can use the function 'read.csv()'. The variable 'call' uses dummy coding and is equal to 1 if a resume received a callback. Use relative frequencies such that the table shows whether whites or Blacks are more likely to receive a callback. This should reproduce the main finding of Bertrand and Mullainathan (2004): "White names receive 50 percent more callbacks for interviews."

### Exercise 4

Load the 'birthwt' data set from the MASS package and create a bar plot of the absolute frequencies of the ethnicity variable ('race'). To do so, you can use ggplot2 and the 'geom_bar()' function. To learn more about bar plots with ggplot2 and how to costumize them you can consult chapter 3 in the Wickham/Grolemund book and chapter 4 in the book by Healy.

### Exercise 5

Write a function which calculates the average absolute deviation from the mean [1]. It should have an argument which allows to deal with missing values, similar to the mean() function. Apply your function to the following test cases:

* 1:10
* rnorm(1000)
* c(2,5,13,NA,2)

[1] https://en.wikipedia.org/wiki/Average_absolute_deviation#Mean_absolute_deviation_around_a_central_point


  
