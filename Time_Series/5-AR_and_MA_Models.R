#-------------------------------------#
#         Autoregressive Models       #
#                                     #
#            Dr  Simmons              #
#-------------------------------------#

# Needed Libraries for Analysis #
library(haven)
library(forecast)
library(fma)
library(tseries)
library(expsmooth)
library(lmtest)
library(zoo)
library(dyn)
file.dir <- "~/Desktop/MSA/Time Series/Course Notes/Data/Class Data"
input.file2 <- "ar2.sas7bdat"


AR2 <- read_sas(paste(file.dir, input.file2, sep = "/"))

# Creating Time Series Data Objects #
Y <- ts(AR2$Y)

# Building an Autoregressive Model - AR Data #
AR.Model <- Arima(Y, order = c(2, 0, 0))
summary(AR.Model)
# Run the ACF and PACF plots before we run the model to see what we might need to fit
Acf(Y, main = "")$acf
Pacf(Y, main = "")$acf
# Build the model, run the ACF and PACF on the residuals from the model and this should show us we are good
Acf(AR.Model$residuals, main = "")$acf
Pacf(AR.Model$residuals, main = "")$acf

# In here, the "fitdf=2" is when we run an AR2 model
White.LB <- rep(NA, 10)
for(i in 1:10){
  White.LB[i] <- Box.test(AR.Model$residuals, lag = i, type = "Ljung", fitdf = 2)$p.value
}

White.LB <- pmin(White.LB, 0.2)
barplot(White.LB, main = "Ljung-Box Test P-values", ylab = "Probabilities", xlab = "Lags", ylim = c(0, 0.2))
abline(h = 0.01, lty = "dashed", col = "black")
abline(h = 0.05, lty = "dashed", col = "black")

######If you want to skip some values:
# AR1, AR2, Mean
AR.Model <- Arima(Y, order = c(2, 0, 0),fixed=c(0,NA,NA))
?Arima()
summary(AR.Model)
### with just AR terms of 1,2,4
# AR1, AR2, AR3, AR4, Mean
# NA's will estimate
# 0's are 0
AR.Model <- Arima(Y, order = c(4, 0, 0),fixed=c(NA,NA,0,NA,NA))
summary(AR.Model)
# https://grokbase.com/t/r/r-help/041ehnnkdq/r-fixed-parameters-in-an-ar-or-arima-model
# if you have a trend, you would have to use xreg=x and then also put in an NA in the fixed() for the values

# to fit to another
#https://stats.stackexchange.com/questions/55937/how-to-use-a-fitted-model-parameters-for-forecasting-other-time-series

set.seed(9276)
y<-arima.sim(model=list(ma=c(.9)),n=100) 

Acf(y, main = "")$acf
Pacf(y, main = "")$acf
MA.Model <- Arima(y, order = c(0, 0, 4))
summary(MA.Model)
Acf(MA.Model$residuals, main = "")$acf
Pacf(MA.Model$residuals, main = "")$acf

White.LB <- rep(NA, 10)
for(i in 1:10){
  White.LB[i] <- Box.test(MA.Model$residuals, lag = i, type = "Ljung", fitdf = 2)$p.value
}

White.LB <- pmin(White.LB, 0.2)
barplot(White.LB, main = "Ljung-Box Test P-values", ylab = "Probabilities", xlab = "Lags", ylim = c(0, 0.2))
abline(h = 0.01, lty = "dashed", col = "black")
abline(h = 0.05, lty = "dashed", col = "black")