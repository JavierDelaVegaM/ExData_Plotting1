## Load data file to data frame, indicating that data has header and that the separator between
## fields is the ";" and that the values "?" in numeric fields convert them to NA.
## If this is not done, all data are obtained as data streams.
tabAll = read.table("household_power_consumption.txt", header=TRUE, sep = ";",  na.strings="?")

## The date and time fields are converted to datetime. The result is stored in another data frame
tab4=NULL
tab4 = cbind(fecha=strptime(paste(tabAll[,1], tabAll[,2]),"%d/%m/%Y %H:%M:%S"), tabAll[,3:9]) ## Con fecha y horario junto
## Data that are entering the dates of 1 and February 2, 2007 are extracted.
tab5 = subset(tab4, fecha >= "2007-02-01" & fecha < "2007-02-03")


## PLOT
## Create the chart data frequencies 3 "Energy metering sub 1, 2 and 3" vs the period in days.
plot(x=tab5$fecha, y=tab5$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=tab5$fecha, y=tab5$Sub_metering_2, type="l", col="red")
lines(x=tab5$fecha, y=tab5$Sub_metering_3, type="l", col="blue")
## A legend of each of the graphs are created.
legend("topright", lty=c(1,1,1), lwd=c(1.5,1.5, 1.5), col=c("black", "blue", "red"), legend=c("Sub metering_1", "Sub metering_2", "Sub metering_3"))
## Save the graphic in a png file.
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()