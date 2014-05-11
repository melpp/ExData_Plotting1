data<-read.table("household_power_consumption.txt",header =TRUE,
                 sep=";", na.strings = "?")
data$Date= as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,"%T")
plotdata<-subset(data, Date=="2007-02-02" | Date== "2007-02-01")
hist(plotdata$Global_active_power, col="red", ylab="Frequency", 
     xlab="Global Active Power (kilowatts)")