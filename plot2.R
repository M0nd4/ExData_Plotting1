## Read data.
datos <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Subset of filtered data with related days.
datos<- subset(datos, (datos$Date == "1/2/2007" | datos$Date== "2/2/2007")) 

## Convert to date and time
datos$DateTime <- strptime(paste(datos$Date, datos$Time), '%d/%m/%Y %H:%M:%S')

## Plotting
plot(datos$DateTime, datos$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (Kw)", xlab="")

## Saving the file
dev.copy(png, file="plot2.png")

dev.off()







