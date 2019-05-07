# Importing the dataset

dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Creating Support Vector Regression Model(eps- regression)

library(e1071)
reg_1 = svm(formula= Salary~.,data= dataset,type='eps-regression',kernel = 'radial')

# Predicting a new result

svrEPS = predict(reg_1, data.frame(Level = 6.5))

# Visualising the SVR Model results

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(reg_1, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR"eps" Model)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the SVR Model results (for higher resolution and smoother curve)


x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg_1, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR"eps_Hi" Model)') +
  xlab('Level') +
  ylab('Salary')



#-------------------------------------------------------------------------------------#


# Creating Support Vector Regression Model(nu- regression)

reg_2 = svm(formula= Salary~.,data= dataset,type='nu-regression',kernel = 'radial')

# Predicting a new result

svrNU = predict(reg_2, data.frame(Level = 6.5))

# Visualising the SVR Model results


ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(reg_2, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR"nu" Model)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the SVR Model results (for higher resolution and smoother curve)


ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg_2, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR"nu_Hi" Model)') +
  xlab('Level') +
  ylab('Salary')



#---------------------------------------------------------------------#


# Creating Decision Tree Model
library(rpart)
reg_3 = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

# Predicting a new result with Decision Tree Regression
DTR = predict(reg_3, data.frame(Level = 6.5))

# Visualising the Decision Tree Regression results (higher resolution)



ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg_3, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (D. Tr. model)') +
  xlab('Level') +
  ylab('Salary')


#--------------------------------------------------------------------------#

# Creating Random Forest regression Model
library(randomForest)
set.seed(0)
reg_4 = randomForest(x = dataset[-2],y = dataset$Salary,ntree = 500)

# Predicting a new result with Random Forest Regression
RFR = predict(reg_4, data.frame(Level = 6.5))

# Visualising the Random Forest Regression results (higher resolution)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg_4, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression)') +
  xlab('Level') +
  ylab('Salary')



#-------------------------------------------------------------------------#



# Adding new Levels
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
dataset$Level5 = dataset$Level^5


# Creating Polynomial Regression Model
reg_5 = lm(formula = Salary ~ .,data = dataset)



# Predicting a new result with Polynomial Regression
PolyLR = predict(reg_5, data.frame(Level = 6.5,
                             Level2 = 6.5^2,
                             Level3 = 6.5^3,
                             Level4 = 6.5^4,
                             Level5 = 6.5^5))



# Visualising the Polynomial Regression results



ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(reg_5, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the Regression Model results (for higher resolution and smoother curve)


ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg_5,newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4,
                                                             Level5 = x_grid^5))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression"Hi")') +
  xlab('Level') +
  ylab('Salary')

#------------------------------x-x-x-x-x----------------------------#

