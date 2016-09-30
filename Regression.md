## R-squared
> It is the percentage of the response variable variation that is explained by a linear model.

> R-squared = Explained variation / Total variation

R-squared is always between 0 and 100%:

- 0% indicates that the model explains none of the variability of the response data around its mean.
- 100% indicates that the model explains all the variability of the response data around its mean.


## Low R-squared values sometimes is acceptable
> Low R-squared values doesn't always mean BAD.

- Any field that attempts to predict human behavior, such as psychology, typically has R-squared values lower than 50%. Humans are simply harder to predict than, say, physical processes.

- if your R-squared value is low but you have statistically significant predictors, you can still draw important conclusions about how changes in the predictor values are associated with changes in the response value.

-A low R-squared is most problematic when you want to produce predictions that are reasonably precise (have a small enough [prediction interval](http://blog.minitab.com/blog/adventures-in-statistics/when-should-i-use-confidence-intervals-prediction-intervals-and-tolerance-intervals))

So, what’s to be done if you have significant predictors but a low R-squared value? I can hear some of you saying, "add more variables to the model!"

In some cases, it’s possible that additional predictors can increase the true explanatory power of the model. However, in other cases, the data contain an inherently higher amount of unexplainable variability. For example, many psychology studies have R-squared values less that 50% because people are fairly unpredictable.

The good news is that even when R-squared is low, low P values still indicate a real relationship between the significant predictors and the response variable.

## Conclusion
- The coefficients estimate the trends while R-squared represents the scatter around the regression line.
- The interpretations of the significant variables are the same for both high and low R-squared models.
- Low R-squared values are problematic when you need precise predictions.




## Regression Diagnostics
- multicolinearity
  -  use kappa() and VIF() to verify;
  - use stepAIC() to reduce multicolinearity

- Regression residuals. Outliers. Influential observations
  - residual analysis - residuals could show how well or poorly a model represents data.
    - use plot(lm()) to show the residual plots- analyze the diagnostic plots
      - which= 1:
> Ideally we want to see that the points in the Residuals vs Fitted plot are randomly scattered with no particular pattern. There could be a non-linear relationship between predictor variables and an outcome variable and the pattern could show up in this plot if the model doesn't capture the non-linear relationship.If you find equally spread residuals around a horizontal line without distinct patterns, that is a good indication you don't have non-linear relationships.
      - which= 2:
> This plot shows if residuals are normally distributed. Do residuals follow a straight line well or do they deviate severely? It's good if residuals are within the dashed red intervals, indicating that the residuals follow a normal distribution
  - identify possible outliers- an outlier is defined as an observation that has a large residual. In other words, the observed value for the point is very different from that predicted by the regression model.
    - can see the diagnostic plots (above)
    - or use outlierTest() (in car package)
  - finally, identify any overly influential observations- An influential observation is defined as an observation that changes the slope of the line. Thus, influential points have a large influence on the fit of the model.
    - which= 5 and 4: Cook's Distance
> Cook's D plot helps us to find influential cases.
> **Not all outliers are influential in regression**. Even though data have extreme values, they might not be influential to determine a regression line. That means, the results wouldn't be much different if we exclude them from analysis.
  On the other hand, some cases could be very influential even if they are not outliers. They can alter the results if we exclude them from analysis. Influential cases are outside of a dashed line that represents Cook's distance. (meaning they have high Cook's distance scores).
    - influence.measures(lm())- reports several useful statistics (DFBETAS, DFFITS, covariance ratio, Cook's distance, and hat matrix values) for identifying influential observations. Its main argument is the model object from your regression
  - To decide whether keep a specific predictor in the model or not?
    - try to exclude that variable, then do a regression again
      - how R-squared changes
        - if not change greatly, can consider exclude it
      - at the statistical significance of the change
        - do anova(lm()_1,lm()_2)- p < 0.05 then can consider keep it, > 0.05, then can exclude it

## Predicting with a regression model
  - use predict()
    - Once you have a linear model, making predictions is quite easy because the predict() function does it. It returns a vector of predicted values with one prediction for every row in the data.
  - Prediction intervals
    - To obtain prediction intervals, add interval=“prediction” to predict()
  - Regression with interactions of predictors
    - In regression, an interaction occurs when the product of two predictor variables X1 and X2 is also a significant predictor
    - The regression equation then is: Y = a0 + b1X1+ b2X2+ b2X3+. + bkXk + c12X1X2
    - To add interaction to a model, for example model1, we use the syntax:
      - update(model1, . ~ . + predictor1*predictor2) or
      - update(model1, . ~ . + predictor1:predictor2)
      - then continue use anova(lm()_1,lm()_2) or calculate how R-squared changes to decide whether need to add predictor1*predictor2 into model; if not significant, which means the p-value is bigger than 0.05 or the difference is small, then **no need to interaction to a model**, the interaction doesn't contribute the model

## Regression with categorical predictors
  - Discussion of categorical variables in the R output
    - do lm() to categorical predictors, sometimes will get 'domin' results:
      - for example: in category A, there is A1 and A2, however, in lm(), it will prossibly show AA1, and do not show AA2, because A2 used as a baseline, and the coefficient for value "A1" is compare to that basline. if the P-value of AA1 is < 0.05 (significant), and that means for the A1 the **Response** is significantly different to he baseline, and therefore, the A is siginficantly affects the **Response** variable.

## Interaction of categorical variables
  - refer to ordinal variables
    - ANOVA- a more general version of the t-test, or a special case of linear regression in which all predictors are categorical. **avo()** (between variables) not the **anova()** (between models)
