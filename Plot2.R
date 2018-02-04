## Load dplyr library 
library(dplyr)  

## Set working directory, read data and select data only for 1/2/2007 and 2/2/2007
setwd("C:/Users/rpardorojo/Documents/SAP EPM/9 Data Science toolbox/Data") 
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
plotdata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

## Transform date to Date format and create a new variable with Date and Time joined
plotdata$Date <- as.Date(plotdata$Date,"%d/%m/%Y")
plotdata<-cbind(plotdata, "DateTime" = as.POSIXct(paste(plotdata$Date, plotdata$Time)))

## Create Plot 2
png("Plot2.png", width=480, height=480)
plot(plotdata$Global_active_power ~ plotdata$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
dev.off()