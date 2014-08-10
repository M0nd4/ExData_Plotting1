## Read data.
datos <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


## Subset of filtered data with related days.
datos<- subset(datos, (datos$Date == "1/2/2007" | datos$Date== "2/2/2007")) 


## Plotting
hist(datos$Global_active_power, col= "red", xlab= "Global Active Power (Kw)", ylab= "Frequency", main= "Global Active Power")

## Saving the file
dev.copy(png, file="plot1.png")

dev.off()
