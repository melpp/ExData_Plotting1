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

plot4data<- subset(plotData,Global_active_power<0.5 )
##Create and save plots
png(file = "plot4.png", height = 480, width = 480)
par(mfrow=c(2,2), cex=0.5)
#first plot
with(plotData, plot(datetime, Global_active_power, 
                    type="l", xlab= " ", ylab= "Global Active Power"))
#Second plot
with(plotData, plot(datetime, Voltage, 
                    type="l", xlab= "datetime", ylab= "Voltage"))

#third plot
plot(plotData$datetime, plotData$Sub_metering_1, col="black",
     type="l", xlab= " ",
     ylab= "Energy sub metering")
lines(x=plotData$datetime, y=plotData$Sub_metering_2, col="red")
lines(x=plotData$datetime, y=plotData$Sub_metering_3, col="blue")
legend("topright", cex=0.2, lty=1, col=c("black","red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#fourth plot
with(subset(plotData, Global_active_power<=0.5),plot(datetime, 
     Global_active_power, 
                    type="l", xlab= "datetime ", 
                    ylab= "Global_active_power"))
dev.off()
