URL <- "/Users/alex/Documents/R directory/Exploratory data/household_power_consumption-2.txt"
library(sqldf)
fileSql <- "select * from file where Date= '1/2/2007' OR Date= '2/2/2007'"
data <- read.csv2.sql(file=URL, sql= fileSql, header =TRUE, row.names = NULL, na.strings="NA",colClasses="character")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz="C")

#2
data[,3] <- as.numeric(data[,3])
png(filename="/Users/alex/Documents/R directory/ExData_Plotting1/plot2.png",width=480,height=480)
with(data,plot(DateTime,Global_active_power,type="l",col="black",ylab="Global Active Power(Kilowatts)"))
dev.off()
