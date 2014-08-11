#### Reference
#### https://github.com/maurotrb/ExData_Plotting1

png("plot3.png", width = 480, height = 480)

#### Read data.
datos <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#### Subset of filtered data with related days.
datos<- subset(datos, (datos$Date == "1/2/2007" | datos$Date== "2/2/2007")) 

#### Convert to date and time
datos$DateTime <- strptime(paste(datos$Date, datos$Time), '%d/%m/%Y %H:%M:%S')

#### Plotting
plot( datos$DateTime, datos$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")             
lines(datos$DateTime, datos$Sub_metering_2, xlab="", ylab="Energy sub metering", type="l", col="Red")  
lines(datos$DateTime, datos$Sub_metering_3, xlab="", ylab="Energy sub metering", type="l", col="Blue") 
## Legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1, 1, 1))

#### Saving the file
## not properly recorded legends
## dev.copy(png, file="plot3.png")

#### Closing device
dev.off()
