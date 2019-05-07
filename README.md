This is a basic Regression Model application and analysis on the Kirill Eremenko's Position_Salaries.csv file from Machine Learning A-Z with R-Language.

# Problem Statement Description: 
 1. This is a simple continuous type problem in which a data scientist(say XYZ) wants to predict the salary of an upcoming employee in his previous company 
     and for this he had arranged some of the data from that company.
 2. This Data gives detail about 10 different post and their salary at the beginning and he also came to know about the fact that a person moves to the next level, 
     if he had completed 4 years in his previous position.
 3. This new expected employee has 2 years experience at Country Manager's post in his previous company.
 4. Now, It's his(XYZ) job to check whether this new employee is telling the TRUTH or playing a BLUFF.
 
 
 # My approach to tackle the Problem:
 1.  I checked the dataset for any anomalies, since, it was a very small dataset,so, I checked it manually.
 2.  After this, i checked the trend of the graph through Excel(Position_Salaries_Excel_Visualisation) 
     and found out that the graph was not Linear.(Note: Open Position_Salaries_Excel_Visualisation in Excel).
 3.  So, the plot could not be :-
                                * Linear Regression   
                                * SVR : (Kernel ='Linear')
 4.  From the plot it was pretty much clear that it could not be a sigmoid, it must be a 'gamma(radial)' or 'polynomial'.
 5.  So, I then narrowed down my approach to the following model types:- 
                                * Polynomial Regressor
								* SVR: (eps-regression and nu- regression with Kernel = 'Radial')
								* Decision Tree Regressor
								* Random Tree Regressor
 6.  So, I first imported the dataset and then choose the 2nd and the 3rd Coloumn as 
         1st and 2nd coloumns are basically denoting same thing that is Level.
 7.  Then, I added four new Levels in the dataset with values having powers of 2,3,4 and 5 to the Level 
         and laid the basis of Polynomial Regtressor.
 8.  Since, the dataset was very evenly distributed, I didn't need to Feature scale the data.
 9.  Also, we had to find the reqired value, so no splitting of  data into test set and training set was required.
 10. After this, I created polynomial regressor with degree '5' and plotted the graph with the help of 'ggplot2' library 
         and predicted the value of Estimated Salary at Level 6.5 using the 'predict' function.
 11. Then, I created SVR Model with eps- and nu- regressor taking Kernel = 'radial' by importing the 'e1071' library 
         and did the same process of analysing the predicted value and plot.
 12. Next, I made the Decision Tree Model using 'rpart' library and visualise the model at high resolution to provide a more accurate and reasonable graph.
 13. I did the same for Random Forest Regression and analyse that using different number of trees(for e.g. 10,100,300 etc.) using 'randomForest' library 
         and also visualise at higher resolution for the same reason as Decision Tree Regressor.
 14. From, the careful analysis I understood that Polynomial Regression Model(degree = '5') is best for the given analysis.
 15. And as for the result,i.e., if the expected new employee is 'Telling the Truth' or 'Playing a Bluff', I leave it at 'Suspense'.
 
 
 
 Note : In the Final Combined Model, I implemented Polynomial Regression at last because i had to add the levels in the dataset 
         and adding them at the start would result into adding an extra line of code in each regressor to take which coloumns.
 --------------------------------------------------x-x-x-x-x---------------------------------------------------------
