library(openair)
# PARA USAR OPENAIR Se necesita que la
# columna con los datos fecha, se llame "date"
# y que sea POSIXct
# Leyendo el archivo
asu_pm25 <- read.table("data/measurements_1656789.csv", #file.choose()
                       sep = ",", dec = ".",
                       header = T)

# Creé una columna date con datos de fecha en POSIXct
asu_pm25$date <- as.POSIXct(
  strptime(asu_pm25$dateLocal, format = "%Y-%m-%dT%H:%M:%S-03:00")
)

# Seleccioné las columnas que quiero trabajar
# Y cambié de nombre
pm25 <- asu_pm25[, c("date", "value")]
names(pm25)[2] <- "pm25"

summaryPlot(pm25)
summaryPlot(pm25, period = "months")

# Plots y medias temporales
timePlot(pm25, pollutant = "pm25")
timePlot(pm25, pollutant = "pm25", avg.time = "day")
timePlot(pm25, pollutant = "pm25", avg.time = "8 hour")

# Média 8 horas movil
pm25 <- rollingMean(pm25, pollutant = "pm25", width = 8)

# Datos meteorológicos
asu <- read.table("~/Downloads/SGAS_271123.csv", #file.choose()
                  sep = ",",
                  dec = ".",
                  header = TRUE,
                  na.strings = "M")
# Creo una columna con la fecha as POSIXct
asu$date <- as.POSIXct(
  strptime(asu$valid, format = "%Y-%m-%d %H:%M")
)

#Transformo a m/s
asu$ws <-  asu$sknt * 0.51

windRose(asu, ws = "ws", wd = "drct")
windRose(asu, ws = "ws", wd = "drct", angle = 45)
windRose(asu, ws = "ws", wd = "drct", angle = 45,
         paddle = F)
windRose(asu, ws = "ws", wd = "drct", angle = 45,
         paddle = F, type = "daylight")
windRose(asu, ws = "ws", wd = "drct", angle = 45,
         paddle = F, type = "season")
windRose(asu, ws = "ws", wd = "drct", angle = 45,
         paddle = F, type = "season",
         hemisphere="southern")

summaryPlot(asu)

# timeVariation
timeVariation(pm25, pollutant = "pm25")
calendarPlot(pm25, pollutant = "pm25")

# En vez de aggregate usar timeAverage
timeAverage(asu, avg.time = "day")
timeAverage(asu, avg.time = "month")

# trendLevel tempc
trendLevel(asu, pollutant = "tmpf")

# PAQUETE PARA LEER EXCEL
library(readxl) # install.packages("readxl")

exemplo <- read_excel(file.choose(), sheet = "Sheet1")
exemplo2 <- read_excel("data/ejemplo_excel.xlsx",
                       sheet = "test")
