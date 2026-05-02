#load libraries
library(readxl)
library(ggplot2)
library(dplyr)

#loading the birthweight_smoking file
data <- read_excel(("C:/Users/sassy/Documents/School/Statistical Methods and Data Analysis 625.603/Assignments/Project 2/birthweight_smoking.xlsx"))

#check structure and first rows of the data
str(data)
head(data)

#converting relevant variables
data$smoker <- as.factor(data$smoker)  #converting to categorical if needed
data$birthweight <- as.numeric(data$birthweight)  #ensures birthweight is numeric

#part 1: getting to know the data and also the average of birthrate for mothers who smoke
#summary of the data
summary(data)

#histogram of birthweight by smoking status
ggplot(data, aes(x = birthweight, fill = as.factor(smoker))) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  labs(title = "Distribution of Birthweight by Smoking Status", 
       x = "Birthweight (grams)", 
       fill = "Smoker")

#average birthweight for smokers and non-smokers
avg_birthweight_smokers <- mean(data$birthweight[data$smoker == 1], na.rm = TRUE)
avg_birthweight_non_smokers <- mean(data$birthweight[data$smoker == 0], na.rm = TRUE)

cat("Average Birthweight (Smokers):", avg_birthweight_smokers, "\n")
cat("Average Birthweight (Non-Smokers):", avg_birthweight_non_smokers, "\n")

#part 2: exploring associations
#simple regression: birthweight ~ smoker
model_smoker <- lm(birthweight ~ smoker, data = data)
summary(model_smoker)

#define predictors
predictors <- c("smoker", "age", "educ", "unmarried", "alcohol", "drinks", "tripre1", "tripre2", "tripre3", "nprevist")

#loop to generate scatter plots or boxplots
for (predictor in predictors) {
  if (is.numeric(data[[predictor]])) {
#scatter plot for numeric predictors
    p <- ggplot(data, aes_string(x = predictor, y = "birthweight")) +
      geom_point(alpha = 0.5) +
      geom_smooth(method = "lm", se = FALSE, color = "blue") +
      labs(title = paste("Scatter Plot: Birthweight vs.", predictor),
           x = predictor, y = "Birthweight (grams)") +
      theme_minimal()
    print(p)
  } else if (is.factor(data[[predictor]])) {
#boxplot for categorical predictors
    p <- ggplot(data, aes_string(x = predictor, y = "birthweight")) +
      geom_boxplot() +
      labs(title = paste("Boxplot: Birthweight by", predictor),
           x = predictor, y = "Birthweight (grams)") +
      theme_minimal()
    print(p)
  }
}

#multiple regression with smoker, alcohol, and nprevist
model_mult <- lm(birthweight ~ smoker + alcohol + nprevist, data = data)
summary(model_mult)

#predict Jane's infant's birthweight
#ensure smoker is a factor in jane_data
jane_data <- data.frame(smoker = factor(1, levels = c(0, 1)),  #match the levels in the dataset
                        alcohol = 0,  
                        nprevist = 8)  

#predict Jane's infant's birthweight
predicted_birthweight <- predict(model_mult, newdata = jane_data)

#print the predicted birthweight
cat("Predicted Birthweight for Jane's infant:", predicted_birthweight, "grams\n")

#part 3: multiple regression
#regression using binary variables for prenatal care
model_tripre <- lm(birthweight ~ smoker + alcohol + tripre0 + tripre2 + tripre3, data = data)
summary(model_tripre)

#regression including tripre1
model_tripre_all <- lm(birthweight ~ smoker + alcohol + tripre0 + tripre1 + tripre2 + tripre3, data = data)

#compare R-squared
r2_model_tripre <- summary(model_tripre)$r.squared
r2_model_mult <- summary(model_mult)$r.squared

cat("R² for Model with tripre variables:", r2_model_tripre, "\n")
cat("R² for Model (2c):", r2_model_mult, "\n")

#part 4: adding binary prenatal variable
#regression including unmarried
model_unmarried <- lm(birthweight ~ smoker + alcohol + nprevist + unmarried, data = data)
summary(model_unmarried)

#compare smoker coefficients across models
cat("Coefficient for smoker (simple model):", coef(model_smoker)["smoker1"], "\n")
cat("Coefficient for smoker (multiple model):", coef(model_mult)["smoker1"], "\n")
cat("Coefficient for smoker (with unmarried):", coef(model_unmarried)["smoker1"], "\n")

#part 5: adding marital status
#full model with all predictors
#add additional variables (education and drinks) to the regression
model_extended <- lm(birthweight ~ smoker + alcohol + nprevist + unmarried + educ + drinks, data = data)
summary(model_extended)

#check improvements in R-squared or adjusted R-squared
cat("R-squared (simple):", summary(model_smoker)$r.squared, "\n")
cat("R-squared (multiple):", summary(model_mult)$r.squared, "\n")
cat("R-squared (full):", summary(model_extended)$r.squared, "\n")


library(haven)
data <- read_dta("C:/Users/sassy/Documents/School/Statistical Methods and Data Analysis 625.603/Assignments/Project 2/birthweight_smoking.dta")
head(data)