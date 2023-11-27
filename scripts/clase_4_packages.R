# REPASO
# 1. Conocer tu dato: columnas con nombre? separdor? sepaarador decimal?
# 2. Usar read.table
# 3. Explorar con str()
# na.string dentro de read.table, sirve para decirle a R
# cual fue la palabra/letra/codigo que se usó para definir NA

asu <- read.table("~/Downloads/SGAS_271123.csv", #file.choose()
                  sep = ",",
                  dec = ".",
                  header = TRUE,
                  na.strings = "M")

# na.rm : sirve para desconsiderar los NA para hacer calculos
mean(asu$tmpf, na.rm = T)

# Explorar dataframe
head(asu)
tail(asu)
nrow(asu)
ncol(asu)
dim(asu)

# Creamos una columna de tempC
asu$tempc <- ( asu$tmpf - 32 ) * 5 / 9
asu$ws <- asu$sknt * 0.51

# DECIR A R QUE TENEMOS UNA COLUMNA DE FECHA!
# "2022-01-01 00:00"
# as.POSIXct + strptime
asu$date <- as.POSIXct(
  strptime(asu$valid, format = "%Y-%m-%d %H:%M")
)

plot(asu$date, asu$tempc, t = "l")

# Preguntas
# Cuál fue la temperatura mínima
asu[asu$tempc == min(asu$tempc, na.rm = T), "date"]
min(asu$tempc, na.rm = T)
max(asu$tempc, na.rm = T)

# Aggregate
temp_mensual <- aggregate(asu["tempc"], # Qué quiero agrupar
                          format(asu["date"], "%m"), # Como agrupo
                          mean, # que operación en cada grupo
                          na.rm = TRUE)

plot(temp_mensual$tempc, t = "l", xlab = "2022",
     ylab = "Temperatura (ºC)", lwd = 1.5,
     col = "orange", main = "Asunción")


temp_diaria <- aggregate(asu["tempc"], # Qué quiero agrupar
                         format(asu["date"], "%m-%d"), # Como agrupo
                         mean, # que operación en cada grupo
                         na.rm = TRUE)
plot(temp_diaria$tempc, t = "l")

asu2023 <- read.table(file.choose(),
                      sep = "\t",
                      dec = ".",
                      header = T,
                      na.strings = "M")
