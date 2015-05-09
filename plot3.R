Sys.setlocale("LC_ALL", 'en_US.UTF-8')
URL <- "/Users/alex/Documents/R directory/Exploratory data/household_power_consumption-2.txt"
library(sqldf)
fileSql <- "select * from file where Date= '1/2/2007' OR Date= '2/2/2007'"
data <- read.csv2.sql(file=URL, sql= fileSql, header =TRUE, row.names = NULL, na.strings="NA",colClasses="character")
data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz="C")


data[,5] <- as.numeric(data[,5])
png(filename="/Users/alex/Documents/R directory/ExData_Plotting1/plot3.png",width=480,height=480)

#3
with(data, plot(datetime,Voltage,col="black",type="l",xlab="datetime",ylab="Voltage"))
dev.off()