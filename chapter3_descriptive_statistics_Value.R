x <- c(1,2,3,4,5,6)
y <- c(1,1,1,1,2,2,2,3,4,3,3,3,3,3,3)
mean(x) #mean
median(x) #meadian
order(table(y),decreasing = T)
as.numeric(names(table(y)))[which.max(table(y))] #mod
probb <- seq(0.1,0.9,0.1) #quantile
quantile(x)
quantile(x,prob=probb)

max(x)-min(x) #range

as.numeric(quantile(x,prob=.75))-as.numeric(quantile(x,prob=.25)) #inter-quantile range

var(x)
sd(x) #standard deviation- mesure the degree of dispersion
stand <- function(x){
      i <- NULL
      l <- length(x)
      mea <- mean(x)
      vec <- vector(length = l)
      for(k in 1:l){
            vec[k] <- c(i,(x[k]-mea)^2)
      }
      svec <- sum(vec)/(l-1)
      return(sqrt(svec))
      # return(vec)
}
stand(x) == sd(x) #return TRUE, so the sd()  here is calculate the sample standard deviation, not the population standard deviation, and so does the var()

#skewness
skewness <- function(x){
      i <- NULL
      mea <- mean(x)
      l <- length(x)
      vec <- vector(length = l)
      for(k in 1:l){
            vec[k] <- c(i,(x[k]-mea)^3)
      }
      svec <- sum(vec)
      ske <- (l/((1-l)*(l-2))*svec)
      return(ske)      
      
}
barplot(table(y)/15) #relative frequency distribution
skewness(y)

#z-score- define the relative distance between the elements and the mean value of one dataset
#z-score can also be used to test outliers, usually, we treat those data whose corresponding z-scores >abs(3) as outliers.
scale(x)
z_score <- function(x){
      i <- NULL
      mea <- mean(x)
      stand <- sd(x)
      l <- length(x)
      vec <- vector(length = l)
      for(k in 1:l){
            vec[k] <- c(i,(x[k]-mea))
      }
      zscore <- vec/stand
      ls <- list(zscore = zscore, mean = mea, stand_deviation=stand)
      return(ls)
}
z_score(x) 

#Chebyshev's Theorem: there are (1-1/z^2)*100% data lie within number of z standard deviation.
#Empirical Rule: there are 68% of data lie within 1 standard deviation; 95% data lie within 2 standard deviationl; almost data lie within 3 standard deviation.

#five- number summary
summary(x)
boxplot(x)
outlier <- c(x,5,5,5,5,5,5,10)
boxplot(outlier) #the empty spots are the outliers
IQR <- as.numeric(quantile(outlier,prob=.75))-as.numeric(quantile(outlier,prob=.25))
abline(h=quantile(outlier,.25)-IQR,lty=2)
abline(h=quantile(outlier,.75)+IQR,lty=2)
#up-bound and bottom-bound of the box plot
abline(h=median(outlier),lty = 4)
#the original dot lines are called "whisker"

#correlations between/ among variables

#correlations between two variables- covariance and coefficient of association
library(xlsx)
mydata <- read.xlsx2("./data/chapter3/Stereo.xlsx",sheetIndex = 1,header = T)
str(mydata)
mydata$No..of.Commercials <-as.numeric(as.character(mydata$No..of.Commercials))
mydata$Sales.Volume <- as.numeric(as.character(mydata$Sales.Volume))
plot(mydata$Sales.Volume~mydata$No..of.Commercials,pch=20,cex=2)
cov(mydata$No..of.Commercials,mydata$Sales.Volume) 
#cov() here calculate the simple covariance: Sxy= sum((Xi-mean(X))*(Yi-mean(y)))/(n-1); >0 positive linear correlation; <0 negative linear correlation; =0 no linear correlation

abline(v=mean(mydata$No..of.Commercials),lty=2)
abline(h=mean(mydata$Sales.Volume),lty=2)

#However, covariance method will be easily infected by the measurement unit, with different measurement units, it will calculate different value based on its operation

#As a result, we use correlation coefficient to help us enhance the testify process
cor(x=mydata$No..of.Commercials,y=mydata$Sales.Volume,method="pearson") 
#Pearson correlation coeficient: Rxy=Sxy/(Sx*Sy)
cov(mydata$No..of.Commercials,mydata$Sales.Volume)/(sd(mydata$No..of.Commercials)*sd(mydata$Sales.Volume))
#Rxy =1 positive correlation; =0 no correlation; =-1 negative correlation

#correlations among >= 3 variables

#`````````````````````````


#`````````````````````````


#weighted average 
weightedMean <- data.frame(value=c(10,11,12,14,10),weight=c(100,200,100,200,50))
weighted.mean(weightedMean$value,weightedMean$weight)
mean(weightedMean$value)
mean(weightedMean$value) == weighted.mean(weightedMean$value,weightedMean$weight) # mean does not equal to weighted average.


 
