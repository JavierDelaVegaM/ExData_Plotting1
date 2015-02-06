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
## Establece el formato de fecha para que presente los datos como días de la semana.
format(tab5$fecha, format="%a")
## Crea el grafico de frecuencias del dato "Global Active Power" vs el periodo en días.
plot(x=tab5$fecha, y=tab5$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Guarda el gráfico en un archivo png.
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()