
# set directory 

setwd("E:/R")

# clear histroy

rm(list=ls(all=TRUE))

# Read data  Electric power consumption (EPC)

EPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                stringsAsFactors= FALSE, na.strings = "?")

# check the structure and summary of data 

summary(EPC)

str(EPC)

#Merge dates and times and store in DateTime

EPC$DateTime <- as.POSIXct(paste(EPC$Date, EPC$Time), format = " %d/%m/%Y %H:%M:%S")

Check strcuture of DateTime

str(EPC$DateTime)

#Convert date format 

EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")

#Convert times format

EPC$Time <- strptime(EPC$Time, "%H:%M:%S")

# Extract relevant dates

days <- EPC$Date == "2007-02-02" | EPC$Date == "2007-02-01"

EPC <- EPC[days,]

# check new data strcuture 

str(EPC)

# activate plot in png 

png("plot4.png", height = 480, width=480)

# add 4 charts

par(mfrow = c(2,2), mar = c(4.0,4.0,4.0,2.0), ps = 10)

#plot chart 1


plot(EPC$DateTime, EPC$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")

# plot chart 2

plot(EPC$DateTime, EPC$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


# plot chart 3

plot(EPC$DateTime, EPC$Sub_metering_1, type = "l", col = 1, xlab = "", ylab = "Energy sub metering")

lines(EPC$DateTime, EPC$Sub_metering_2, col = 2)

lines(EPC$DateTime, EPC$Sub_metering_3, col = 4)

legend("topright", lty = 1, col= c(1, "2", "4"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n", xjust = 1, yjust = 0)

# plot chart 4

plot(EPC$DateTime, EPC$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Close active graphic device

dev.off()