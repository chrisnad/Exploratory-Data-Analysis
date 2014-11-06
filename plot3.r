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

plot(mydata$DateTime, mydata$Sub_metering_1,
     type="l", #type = line
     xlab="", #x-axis label
     ylab="Energy sub metering", #y-axis label
     col="black") #color

points(mydata$DateTime, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$DateTime, mydata$Sub_metering_3, type = "l", col = "blue")

legend( x="topright",
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"), 
        lty=c(1,1,1))

dev.copy(png, file = "plot3.png")
dev.off()