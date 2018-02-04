## Load dplyr library 
library(dplyr)  

## Set working directory, read data and select data only for 1/2/2007 and 2/2/2007
setwd("C:/Users/rpardorojo/Documents/SAP EPM/9 Data Science toolbox/Data") 
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
plotdata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

## Transform date to Date format and create a new variable with Date and Time joined
plotdata$Date <- as.Date(plotdata$Date,"%d/%m/%Y")
plotdata<-cbind(plotdata, "DateTime" = as.POSIXct(paste(plotdata$Date, plotdata$Time)))

## Create Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(plotdata$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
dev.off()