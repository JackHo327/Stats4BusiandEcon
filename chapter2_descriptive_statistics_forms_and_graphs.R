#count the frequency of categorical data- barplot and histogram
# example(barplot)
random <- as.integer(runif(1000,0,10))
table(random)
relativeFreq <- table(random)/1000
relativeFreq
relativeFreqPercent <- relativeFreq *100
relativeFreqPercent
barplot(table(random))

# example(hist)
hist(random,breaks = 10,xlim=c(0,10))

#draw stem-and-leaf display
ran <- as.integer(runif(100,0,100))
stem(ran)

#create crosstabulatiton
with(airquality,table(OzHi = Ozone >80,Month,useNA = "ifany"))

#scatter diagram and lm
times <- c(2,5,1,3,4,1,5,3,4,2)
money <- c(50,57,41,54,54,38,63,48,59,46)
plot(money~times)
lmodel <- lm(money~times)
abline(lmodel)
