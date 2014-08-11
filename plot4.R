#### Reference
#### https://github.com/maurotrb/ExData_Plotting1

png("plot4.png", width = 480, height = 480)
#### Read data.
datos <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#### Subset of filtered data with related days.
datos<- subset(datos, (datos$Date == "1/2/2007" | datos$Date== "2/2/2007")) 

#### Convert to date and time
datos$DateTime <- strptime(paste(datos$Date, datos$Time), '%d/%m/%Y %H:%M:%S')

#### divide the plot into four parts
par(mfrow=c(2,2)) 

#### Plotting
## Plot 4.1
plot(datos$DateTime, datos$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power", xlab="")
## Plot 4.2
plot(datos$DateTime, datos$Voltage, type="l", xlab="datetime", ylab="Voltage")
## Plot 4.3
plot( datos$DateTime, datos$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")             
lines(datos$DateTime, datos$Sub_metering_2, xlab="", ylab="Energy sub metering", type="l", col="Red")  
lines(datos$DateTime, datos$Sub_metering_3, xlab="", ylab="Energy sub metering", type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1, 1, 1),bty="n")
## Plot 4.4
plot(datos$DateTime, datos$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#### Saving the file

## dev.copy(png, file="plot4.png")
## not properly recorded legends
#### Closing device
dev.off()
