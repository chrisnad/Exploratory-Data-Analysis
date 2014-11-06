#Download the txt file to your working directory then proceed as follow

header <- as.vector(t(read.table("household_power_consumption.txt", 
                                 sep = ";", 
                                 nrows = 1)))

mydata <- read.table("household_power_consumption.txt", 
                     sep = ";", 
                     col.names = header, 
                     nrows = 2880, 
                     skip = 66637)

#### ####

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(1,1))

plot(mydata$DateTime, mydata$Global_active_power,
     type="l", #type = line
     xlab="", #x-axis label
     ylab="Global Active Power (kilowatts)") #y-axis label

dev.copy(png, file = "plot2.png")
dev.off()