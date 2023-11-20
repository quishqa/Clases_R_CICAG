library(openair)

# Datos vienen de
# https://explore.openaq.org/locations/1656789
asu_pm25 <- read.table(
  "data/measurements_1656789.csv",
  header = TRUE,
  sep = ","
)

asu_pm25$date <- as.POSIXct(
  strptime(asu_pm25$dateLocal,
           "%Y-%m-%dT%H:%M:%S-03:00")
)

# Ojo que los datos están al revés
all_date <- data.frame(
  date = seq(
    asu_pm25$date[nrow(asu_pm25)],
    asu_pm25$date[1],
    by = "hour")
  )

asu_pm25 <- merge(all_date, asu_pm25, all = T)


# Concentración média horaria
mean(asu_pm25$value, na.rm = T)
min(asu_pm25$value, na.rm = T)
max(asu_pm25$value, na.rm = T)

# En Asunción se sobrepasa los niveles de la OMS de [PM2.5]?
# ECA PM2.5 25 ug/m3

pm25_day <- aggregate(asu_pm25["value"],
                      format(asu_pm25["date"], "%m-%d"),
                      mean,
                      na.rm = TRUE)

pm25_day$date <- as.POSIXct(strptime(pm25_day$date,"%m-%d"))
plot(pm25_day$date, pm25_day$value, t = "l", lwd = 1.5,
     ylab = "[ug/m3]",
     xlab = "2023",
     main = "Concentración diaría de PM2.5 - Asunción")
abline(h=25, lwd = 2, lty = 2, col = "red")

# Sí sobrepasa el ECA

# Cuantos días y cuales
days_high_pm25 <- subset(pm25_day, subset = value >= 25)
print(paste("Se sobrepasó el ECA ", nrow(days_high_pm25), "días."))

# Cuál es la hora de mayor concentración
pm25_hour <- aggregate(asu_pm25["value"],
                       format(asu_pm25["date"], "%H"),
                       mean,
                       na.rm = TRUE)
pm25_hour$date <- seq(0, 23)
plot(pm25_hour$date, pm25_hour$value,
     t = "l", lwd = 1.5,
     main = "Concentración horaria de PM2.5 - Asunción",
     ylab = "[ug/m3]",
     xlab = "Hora Local")
points(pm25_hour$date, pm25_hour$value, pch = 19)


plot(pm25_hour$date, pm25_hour$value,
     main = "Concentración horaria de PM2.5 - Asunción",
     ylab = "[ug/m3]",
     xlab = "Hora Local",
     type = "n",
     ylim = c(13, 21))
rect(6, 13.0, 18, 21, col = "lightblue", border="lightblue")
lines(pm25_hour$date, pm25_hour$value, col = "darkorange2",
      lwd = 2)
points(pm25_hour$date, pm25_hour$value, col = "darkorange2",
       pch = 19)

# Boxplot horarios
plot(as.factor(format(asu_pm25$date, "%H")), asu_pm25$value,
     xlab = "Hora Local", ylab = "[ug/m3]", col = "peru")

# Día con mayor concentración
pm25_week <- aggregate(asu_pm25["value"],
                       format(asu_pm25["date"], "%w"),
                       mean,
                       na.rm = TRUE)

# En R  0 = Domingo
pm25_week$date <- c(7, 1:6)
pm25_week <- pm25_week[order(pm25_week$date), ]
days_of_week <- c("Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom")
plot(pm25_week$date, pm25_week$value, t = "n", lwd = 1.5,
     xaxt = "n", xlab = " ", ylab = "[ug/m3]",
     main = "Concentración PM2.5 durante la semana - Asunción",
     ylim=c(13, 20))
rect(6, 13, 7, 20, col = "yellow", border = "yellow")
points(pm25_week$date, pm25_week$value, pch = 19)
lines(pm25_week$date, pm25_week$value, t = "l")
axis(1, at = 1:7, labels = days_of_week)


