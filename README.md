# Birthweight and Maternal Smoking Analysis
Author: Sadia Rahman

## Simple Linear Regression

Model:

$$
\text{birthweight} = \beta_0 + \beta_1 \cdot \text{smoker} + \epsilon
$$

### Distribution of Birthweight by Smoking Status

<img width="805" height="469" alt="1 plot" src="https://github.com/user-attachments/assets/be6b2e35-df4a-4ae6-8793-a1dfa07a0a00" />

### Summary Statistics

- Average birthweight (smokers): 3178.832 grams  
- Average birthweight (non-smokers): 3432.06 grams  

### Interpretation

Infants born to mothers who smoked during pregnancy weigh, on average, **253.23 grams less** than infants born to mothers who did not smoke. This suggests a **negative association** between maternal smoking and birthweight.

## Multiple Linear Regression

Model:

$$
\text{birthweight} = \beta_0 + \beta_1 \cdot \text{smoker} + \beta_2 \cdot \text{alcohol} + \beta_3 \cdot \text{nprevist} + \epsilon
$$

### Scatter Plots (Key Relationships)

<img width="799" height="469" alt="2 plot1" src="https://github.com/user-attachments/assets/9d20135f-928e-44d8-9035-a76b75161326" />
<img width="799" height="469" alt="2 plot6" src="https://github.com/user-attachments/assets/3a1c17ed-e94f-4abc-a7a6-8b874d970b50" />
<img width="799" height="469" alt="2 plot9" src="https://github.com/user-attachments/assets/a9babcb8-81f0-42dd-8a43-f8f394cdb5fb" />
<img width="799" height="469" alt="2 plot8" src="https://github.com/user-attachments/assets/b5f97b22-239b-4f06-95c3-571dd245cb40" />

### Interpretation

<img width="799" height="469" alt="2 plot10" src="https://github.com/user-attachments/assets/ac75e52c-83fe-4e53-977c-3c292316978d" />


The regression shows that smoking is associated with a **decrease in birthweight**, even after controlling for alcohol consumption and prenatal visits.

However, this model provides a more accurate estimate than the simple regression, as it accounts for additional influencing factors.

## Omitted Variable Bias

The simple regression model may suffer from omitted variable bias because it does not include relevant factors such as:

- Prenatal visits  
- Alcohol consumption  
- Education  
- Marital status  

These variables influence birthweight and may also be correlated with smoking.

### Evidence of Bias

- Simple model effect: **−253.23g**  
- Multiple model effect: **−217.58g**  

The reduction in magnitude suggests that the simple model **overestimates** the effect of smoking due to confounding variables.

## Prediction

Using the multiple regression model:

- Jane smokes  
- No alcohol consumption  
- 8 prenatal visits  

Predicted birthweight:

$$
\hat{y} = 3106.23 \text{ grams}
$$

## Prenatal Care (Binary Variables)

### Prenatal Timing Effects

<img width="799" height="469" alt="2 plot4" src="https://github.com/user-attachments/assets/ded0bd44-59ed-4e36-b976-19b776d3178f" />
<img width="799" height="469" alt="2 plot3" src="https://github.com/user-attachments/assets/6d32df06-e248-4547-b94e-b74837b275ba" />
<img width="799" height="469" alt="2 plot2" src="https://github.com/user-attachments/assets/b0decc12-247f-4c24-9d52-46fdeb992ff9" />

### Key Points

- One category (e.g., `tripre1`) is excluded as a reference group to avoid multicollinearity  
- Including all categories leads to unstable or uninterpretable results  

### Interpretation

- No prenatal visits (`tripre0`) is associated with significantly lower birthweight  
- Later prenatal care (2nd or 3rd trimester) results in lower birthweight compared to early care  
- Early prenatal care (1st trimester) is associated with better outcomes  


## Model Comparison

- Model with detailed prenatal timing:
  $$
  R^2 = 0.044657
  $$

- Model with fewer variables:
  $$
  R^2 = 0.072853
  $$

The second model explains more variation, but the first provides more detailed insight into timing effects.

## Adding Marital Status

Model:

$$
\text{birthweight} = \beta_0 + \beta_1 \cdot \text{smoker} + \beta_2 \cdot \text{alcohol} + \beta_3 \cdot \text{nprevist} + \beta_4 \cdot \text{unmarried} + \epsilon
$$

### Interpretation

Being unmarried is associated with a decrease in birthweight of approximately:

$$
-109.76 \text{ grams}
$$

This effect is statistically significant but smaller compared to smoking.

## Effect of Smoking Across Models

- Simple regression: −253.23g  
- Multiple regression: −217.58g  
- Extended model: −176.99g  

### Interpretation

The estimated effect of smoking decreases as more variables are included. This suggests that earlier models **overstated the effect** due to omitted variable bias.

## Extended Model

Model:

$$
\text{birthweight} = \beta_0 + \beta_1 \cdot \text{smoker} + \beta_2 \cdot \text{alcohol} + \beta_3 \cdot \text{nprevist} + \beta_4 \cdot \text{unmarried} + \beta_5 \cdot \text{educ} + \beta_6 \cdot \text{drinks} + \epsilon
$$

### Interpretation

Including additional variables further reduces the estimated effect of smoking, reinforcing the presence of confounding variables.

## Final Insights

- Smoking has a consistent negative effect on birthweight  
- The magnitude of the effect decreases when controlling for additional variables  
- Prenatal care has a positive impact on birthweight  
- Omitted variable bias plays a significant role in simpler models  
