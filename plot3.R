##Read Data
data<-read.table("/Users/melpp/Downloads/household_power_consumption.txt",header =TRUE,
                 sep=";", na.strings = "?")

##Change date format
data$Date= as.Date(data$Date,format="%d/%m/%Y")

##Subset Data
plotData<-subset(data, Date=="2007-02-02" | Date== "2007-02-01")

##Add datetime column
datetime<-paste(plotData$Date,plotData$Time)
datetime<-as.POSIXct(strptime(datetime, "%Y-%m-%d %H:%M:%S"))
plotData<-cbind(plotData, datetime)

##Create and save plot
png(file = "plot3.png", height = 480, width = 480)
##Plot first line and then add other lines
plot(plotData$datetime, plotData$Sub_metering_1, col="black",
     type="l", xlab= " ",
     ylab= "Energy sub metering")
lines(x=plotData$datetime, y=plotData$Sub_metering_2, col="red")
lines(x=plotData$datetime, y=plotData$Sub_metering_3, col="blue")
legend("topright", cex=0.8, lty=1, col=c("black","red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()


