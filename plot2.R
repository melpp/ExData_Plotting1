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
png(file = "plot2.png", height = 480, width = 480)
with(plotData, plot(datetime, Global_active_power, 
                    type="l", xlab= " ", ylab= "Global Active Power (kilowatts)"))

dev.off()

