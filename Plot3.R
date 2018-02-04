## Load dplyr library 
library(dplyr)  

## Set working directory, read data and select data only for 1/2/2007 and 2/2/2007
setwd("C:/Users/rpardorojo/Documents/SAP EPM/9 Data Science toolbox/Data") 
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
plotdata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

## Transform date to Date format and create a new variable with Date and Time joined
plotdata$Date <- as.Date(plotdata$Date,"%d/%m/%Y")
plotdata<-cbind(plotdata, "DateTime" = as.POSIXct(paste(plotdata$Date, plotdata$Time)))

## Create Plot 3
png("Plot3.png", width=480, height=480)
with(plotdata, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(plotdata$Sub_metering_2 ~ plotdata$DateTime, col = 'Red')
lines(plotdata$Sub_metering_3 ~ plotdata$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()