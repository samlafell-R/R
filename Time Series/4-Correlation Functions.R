#------------------------------------#
#        Correlation Functions       #
#                                    #
#           Dr Susan Simmons         #
#------------------------------------#

# Needed Libraries for Analysis #
library(haven)
library(forecast)
library(fma)
library(tseries)
library(expsmooth)
library(lmtest)
library(zoo)
library(dyn)

# Saving File Locations and Uploading SAS File #
file.dir <- "~/Desktop/MSA/Time Series/Course Notes/Data/Class Data"
input.file1 <- "usairlines.sas7bdat"
input.file2 <- "ar2.sas7bdat"

USAirlines <- read_sas(paste(file.dir, input.file1,sep = "/"))
AR2 <- read_sas(paste(file.dir, input.file2, sep = "/"))

# Creating Time Series Data Objects #
Passenger <- ts(USAirlines$Passengers, start = 1990, frequency = 12)

Y <- ts(AR2$Y)

# Lag Plot of Y #
lag.plot(Y, lag = 2, main = "Scatterplots of Y with First 2 Lags", diag = FALSE, layout = c(1, 2))

# Correlation Functions #
Acf(SteelShp, lag = 10)$acf
Pacf(SteelShp, lag = 10)$acf

Acf(Passenger, lag = 40, main = "Autocorrelation Plot for US Airline Passengers")$acf
Pacf(Passenger, lag = 40, main = "Partial Autocorrelation Plot for US Airline Passengers")$acf

# Ljung-Box Test for Steel ES Model #
SES.Steel <- ses(SteelShp, initial = "optimal", h = 24)
White.LB <- rep(NA, 10)
for(i in 1:10){
  White.LB[i] <- Box.test(SES.Steel$residuals, lag = i, type = "Lj", fitdf = 1)$p.value
}

White.LB <- pmin(White.LB, 0.2)
barplot(White.LB, main = "Ljung-Box Test P-values", ylab = "Probabilities", xlab = "Lags", ylim = c(0, 0.2))
abline(h = 0.01, lty = "dashed", col = "black")
abline(h = 0.05, lty = "dashed", col = "black")
