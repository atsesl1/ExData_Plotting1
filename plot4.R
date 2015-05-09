Sys.setlocale("LC_ALL", 'en_US.UTF-8')
URL <- "/Users/alex/Documents/R directory/Exploratory data/household_power_consumption-2.txt"
library(sqldf)
fileSql <- "select * from file where Date= '1/2/2007' OR Date= '2/2/2007'"
data <- read.csv2.sql(file=URL, sql= fileSql, header =TRUE, row.names = NULL, na.strings="NA",colClasses="character")
data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz="C")

data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])
png(filename="/Users/alex/Documents/R directory/ExData_Plotting1/plot4.png",width=480,height=480)
#set the parameters
par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
#1
with(data,{
  plot(datetime,Global_active_power,type="l",col="black",ylab="Global Active Power(Kilowatts)",xlab="")
#2
  plot(datetime,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
    lines(datetime,Sub_metering_2, col="red")
    lines(datetime,Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=1, lty=c(1,1,1))
#3
  plot(datetime,Voltage,col="black",type="l",xlab="datetime",ylab="Voltage")
#4
  plot(datetime,Global_reactive_power,col="black",type="l",xlab="datetime",ylab="Global_reactive_power")
          })
dev.off()