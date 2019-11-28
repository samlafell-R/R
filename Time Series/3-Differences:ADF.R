### Random Walks, Differences

install.packages('imputeTS')
install.packages('tseries')

library(forecast)
library(haven)
library(fma)
library(expsmooth)
library(lmtest)
library(zoo)
library(seasonal)
library(imputeTS)
library(tseries)


##### Augmented Dickey-Fuller test
file.dir <- setwd("/Users/samlafell/Desktop/MSA/Time Series/Data/Class Data/")
input.file1 <- "usairlines.sas7bdat"
input.file2 <- "leadyear.sas7bdat"
input.file3 <- "ebay9899.sas7bdat"
input.file4 <- "fpp_insurance.sas7bdat"

USAirlines <- read_sas(paste(file.dir, input.file1,sep = "/"))
Lead.Year <- read_sas(paste(file.dir, input.file2, sep = "/"))
Ebay <- read_sas(paste(file.dir, input.file3, sep = "/"))
Quotes<-read_sas(paste(file.dir, input.file4, sep = "/"))
Passenger <- ts(USAirlines$Passengers, start=1990, frequency=12)

Quotes.ts<-ts(Quotes$Quotes)
# Augmented Dickey-Fuller Testing #
adf.test(Quotes.ts, alternative = "stationary", k = 0)

ADF.Pvalues <- rep(NA, 3)
for(i in 0:2){
  ADF.Pvalues[i+1] <- adf.test(Quotes.ts, alternative = "stationary", k = i)$p.value
}
ADF.Pvalues


####Deterministic Trend
x=seq(1,48)
set.seed(38752)
error=rnorm(48,0,2.5)
y=3+1.3*x+error
plot(x,y,type='l')
plot(x,y,xlab='Time',ylab='y',main='Example of a trending time series',type='l')
reg.lm=lm(y~x)
summary(reg.lm)
y.ts=ts(y)
arima.trend=Arima(y.ts,xreg=x,order=c(0,0,0)) # AR, I, MA for the order
summary(arima.trend)
res.lm.trend=reg.lm$residuals
res.trend.arima=arima.trend$residuals[1:48]
plot(res.lm.trend,res.trend.arima)
plot(res.trend.arima)
plot(x,y,type='l')
fit.y=arima.trend$fitted

plot(res.trend.arima)
lines(fit.y)

adf.test(y.ts,alternative = "stationary", k = 0)

###Random Walk with Drift

Daily.High <- ts(Ebay$DailyHigh)
Daily.High<-Daily.High %>% na_interpolation(option = "spline")
adf.test(Daily.High,alternative = 'stationary',k=0)
rw.drift=Arima(Daily.High,order=c(0,1,0))
summary(rw.drift)
