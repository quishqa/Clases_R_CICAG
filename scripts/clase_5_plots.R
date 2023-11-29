# Leyendo la información
asu_pm25 <- read.table("data/measurements_1656789.csv",
                       sep = ",", dec = ".",
                       header = T)

# Transformar a POSIXct
asu_pm25$date <- as.POSIXct(
  strptime(asu_pm25$dateLocal, format = "%Y-%m-%dT%H:%M:%S-03:00")
)

pm25 <- asu_pm25[c("date", "value")]
names(pm25)[2] <- "pm25"


# Calcular % excedente de OMS
library(openair)
pm25_day <- timeAverage(pm25, avg.time = "day")
pm25_oms <- pm25_day[pm25_day$pm25 > 15, ]

dias_totales <- nrow(pm25_day)
dias_mayore_oms <- nrow(pm25_oms)
dias_mayore_oms/dias_totales * 100

timePlot(pm25, pollutant = "pm25")


# Generando nuestro plot
plot(pm25$date, pm25$pm25)
plot(pm25$date, pm25$pm25, t = "l")
plot(pm25$date, pm25$pm25, t = "l", col = "red")
plot(pm25$date, pm25$pm25, t = "l", col = "red",
     xlab = "2023")
plot(pm25$date, pm25$pm25, t = "l", col = "red",
     xlab = "2023", ylab = "[ug/m3]")

plot(pm25$date, pm25$pm25, t = "l", col = "red",
     xlab = "2023", ylab = "[ug/m3]",
     main = "Material particulado fino en Asunción")
abline(h = 15, lty = 2) # Agregamos el OMS
legend("topleft", lty = c(1, 2), col = c("red", "black"),
       legend = c("PM2.5", "OMS"), bty = "n",
       cex = 0.6)

# Como salvar lal imagen
# usar png() y recordar cerrar con dev.off()
png("./pm25_asuncion.png", height = 5, width = 7,
    res = 300, units = "in")
plot(pm25$date, pm25$pm25, t = "l", col = "red",
     xlab = "", ylab = "[ug/m3]",
     main = "Material particulado fino en Asunción",
     axes = F)
abline(h = 15, lty = 2) # Agregamos el OMS
legend("topleft", lty = c(1, 2), col = c("red", "black"),
       legend = c("PM2.5", "OMS"), bty = "n",
       cex = 0.6)
axis(2)
axis(1, at = as.numeric(pm25_day$date),
     label = format(pm25_day$date, "%d/%m/%y"))
# grid()
box()
dev.off()


plot(pm25$date, pm25$pm25, t = "l", col = "red",
     xlab = "", ylab = "[ug/m3]",
     main = "Material particulado fino en Asunción",
     axes = F)
abline(h = 15, lty = 2) # Agregamos el OMS
legend("topleft", lty = c(1, 2), col = c("red", "black"),
       legend = c("PM2.5", "OMS"), bty = "n",
       cex = 0.6)
axis(2)
axis(1, at = as.numeric(pm25_day$date),
     label = format(pm25_day$date, "%d/%m/%y"))
# grid()
box()
mtext("Fuente: openaq", side = 1, line = 2.5, cex = 0.7)
# TODO: Cómo colocarlo en la izquierda

hist(pm25$pm25, main = "Material Particulado Fino",
     xlab = "[ug/m3]", col = "orange")

boxplot(pm25$pm25, col = "orange",
        ylab = "[ug/m3]", xlab = "pm25")
