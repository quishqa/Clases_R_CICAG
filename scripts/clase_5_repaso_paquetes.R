# REPASO PAQUETES
# install.packages("riem")
library(riem)

riem_stations(network = "PY__ASOS")

asu <- riem_measures(station = "SGAS",
                     date_start = "1992-01-01",
                     date_end = "2022-12-31")

str(asu)
# Para usar openair necesito que la columna de fecha se llame
# date y sea POSIXct
names(asu)[2] <- "date"

library(openair)
asu$tc <- (asu$tmpf - 32 ) * 5 / 9

timePlot(asu, pollutant = "tc")
timePlot(asu, pollutant = "tc", avg.time = "day")
timePlot(asu, pollutant = "tc", avg.time = "month")

# Rosas de viento
asu$ws <- asu$sknt * 0.51

windRose(asu, ws="ws", wd="drct", angle = 22.5)
windRose(asu, ws="ws", wd="drct", angle = 22.5,
         type = "year")

TheilSen(asu, pollutant = "tc", deseason = TRUE,
         avg.time = "year")

calendarPlot(asu, pollutant = "tc", year = 2022)
