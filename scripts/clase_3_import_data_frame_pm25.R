# Leyendo nuestro archivo de pm25 Asunción
# Para borrar todo lo definido: rm(list = ls())

# 1. Conocer y examinar tus datos
# 2. Leer usando read.table

asu_pm25 <- read.table(file.choose(), 
                       sep = ",", 
                       dec = ".",
                       header = TRUE)
str(asu_pm25)
# 3. Explorar los datos
head(asu_pm25) # Se ven las primeras filas
tail(asu_pm25) # Se ven las últimas filas

# 4. Editar las fechas
# - Crear una nueva columna que se llama date
# - Date es POSIXct
# strptime /as.POSIXct

asu_pm25$date <- as.POSIXct(
  strptime(
    asu_pm25$dateLocal,
    format = "%Y-%m-%dT%H:%M:%S-03:00"
  )
)

pm25 <- asu_pm25[, c("date", "value")]
names(pm25) <- c("date", "mp")

# Figura simple exploratoria
plot(pm25, t = "l", xlab = "2023", 
     ylab = unique(asu_pm25$unit) )
abline(h=25, col = "red")
# Cuál es el valor máximo horario
max(pm25$mp, na.rm = TRUE)
min(pm25$mp, na.rm = TRUE)
mean(pm25$mp, na.rm = TRUE)
median(pm25$mp, na.rm = TRUE)
sd(pm25$mp, na.rm = TRUE)

# Otra figura exploratoria
boxplot(pm25$mp)

# Se pasó el estandár? Cuántas veces?
# WHO [PM2.5] < 15 ug/m3
pm25_day <- aggregate(pm25["mp"], # Que quiero que agrupe
                      format(pm25["date"], "%m-%d"), # Como lo agrupe
                      mean,  # Que opeaciones hacemos
                      na.rm = TRUE)

# Revisando el agrupamiento
# df <- pm25
# df$dia <- format(df$date, "%m-%d")

pm25_day[pm25_day$mp > 15, ]
nrow(pm25_day[pm25_day$mp > 15, ])


# Cual es el comportamiento diurno? Media horaria
pm25_hour <- aggregate(pm25["mp"], # Que quiero agrupar
                       format(pm25["date"], "%H"), # Como lo agrupo
                       mean,  # Que operación aplico a los grupos 
                       na.rm = TRUE)
plot(0:23, pm25_hour$mp, t = "l", 
     ylab = unique(asu_pm25$unit),
     xlab = "Hora Local")