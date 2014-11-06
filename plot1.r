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

par(mfrow = c(1,1))

hist(mydata$Global_active_power, 
     main = "Global active power", 
     xlab = "Global active power (kilowatts)", 
     col = "red")

dev.copy(png, file = "plot1.png")
dev.off()