
# set directory 

setwd("E:/R")

# clear histroy

rm(list=ls(all=TRUE))

# Read data  Electric power consumption (EPC)

EPC <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# check the structure and summary of data 

summary(EPC)

str(EPC)

# change date format

EPC$Date <- as.Date(EPC$Date,format = "%d/%m/%Y")

# Extract relevant dates

days <- EPC$Date == "2007-02-02" | EPC$Date == "2007-02-01"

EPC <- EPC[days,]

# check new data strcuture 

str(EPC)

# activate plot in png 

png("plot1.png", height = 480, width=480)

# add historgram plot and details 

hist(EPC$Global_active_power, col = 2, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

#Close active graphic device 

dev.off()