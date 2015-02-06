## Carga a un data frame los datos del archivo, indicando que tiene cabeceza los datos,
## que el separador entre campos es el ";" y que los valores "?" en los campos numéricos
## los convierta a NA. Si no se hace esto, todos los datos se obtienen como cadenas de datos.
tabAll = read.table("household_power_consumption.txt", header=TRUE, sep = ";",  na.strings="?")

## Los campos de fecha y hora se convierten a tipo datetime. El resultado se almacena en otro data frame 
tab4=NULL
tab4 = cbind(fecha=strptime(paste(tabAll[,1], tabAll[,2]),"%d/%m/%Y %H:%M:%S"), tabAll[,3:9]) ## Con fecha y horario junto
## Se extraen los datos que se encuentran entra las fechas del 1 y 2 de febrero del 2007.
tab5 = subset(tab4, fecha >= "2007-02-01" & fecha < "2007-02-03")


## PLOT
## Divide el área de graficos en 4 partes, (2 x 2)
par(mfcol=c(2, 2))


plot(x=tab5$fecha, y=tab5$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(x=tab5$fecha, y=tab5$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=tab5$fecha, y=tab5$Sub_metering_2, type="l", col="red")
lines(x=tab5$fecha, y=tab5$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), lwd=c(1.5,1.5, 1.5), bty="n", col=c("black", "blue", "red"), legend=c("Sub metering_1", "Sub metering_2", "Sub metering_3"))

plot(x=tab5$fecha, y=tab5$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=tab5$fecha, y=tab5$Global_reactive_power, type="l", xlab="datetime", ylab="Energy_reactive_power")

# Guarda el gráfico en un archivo png.
dev.copy(png, file = "plot4.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()

## Regresa el área de gráficos a una sola sección
par(mfcol=c(1, 1))
