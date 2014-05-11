
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

png("plot3.png", height = 480, width=480)

# add plot and details 

plot(EPC$DateTime, EPC$Sub_metering_1, type = "l", col = 1, xlab = "", 
     ylab = "Energy sub metering")

#Add the line for Sub_metering_2
lines(EPC$DateTime, EPC$Sub_metering_2, col = 2)

#Add the line for Sub_metering_3
lines(EPC$DateTime, EPC$Sub_metering_3, col = 4)

#Add legends 

legend("topright", lty = 1, col= c(1, "2", "4"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close active graphic device
dev.off()

