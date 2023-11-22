# Respaso aula 1
1 / 60
5 * 3600

# Para definir variables <- 
# Alt + -
g <- 9.81

g_nombre <- "aceleración de la gravedad"
g_unidades <- "m s^2"

otro_complejo <- complex(real = 1, imaginary = 5)

# Pedir ayuda a R
?class

# VECTORES -> conjunto de elementos (elementos = numeroc, caracteres, etc)
# Todos los vectores: tienen el mismo tipo de elementos
# c()
?c()
num_1al10 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

num_1al10_v2 <- seq(1, 10) # seq(num_inicial, num_final, intervalo)
num_1al100_pares <- seq(0, 100, 2)
num_1al10_v3 <- 1:10

dias_semana <- c("Lun", "Mar", "Mier", "Juev", "Vie", "Sab", "Dom")

# Para saber el tamaño de los vectores/data.frames usamos Length
length(dias_semana)

# Length cuenta NA? No sé? vamos a averiguarlo
vector_con_na <- c(1, 2, 4, 52435, NA, NA) # Sí los cuenta

# Cómo cambiarlo
vector_raro <- c(1, 2, 3, "-", "-")
vector_raro[vector_raro == "-"]  <- NA
# TRADUCCIÒN: Quiero que del vector_raro,
# selecciones los elementos que son "-"
# Y los reemplaces con NA
vector_raro_num <- as.numeric(vector_raro)
# Sì los cuenta

gee <- c("H2O", "CO2", "CH4", "O2")
# usamos [] para seleccionar!
# elementos en un vector:nombre_vector[posición] <- nuevo_valor
gee[4] <- "O3"
# Se debe reemplazar el mismo numero de elementos

# Data.Frame -> conjunto de vectores usamos la función 
# data.frame()
# Vamos a crear un data.frame con la composición del aire
gas <- c("N2", "O2", "Ar", "CO2")
pm <- c(2 * 14, 2 * 16, 40, 12 + 2 * 16)
por <- c(78, 20.9, 0.9, 0.04)

aire <- data.frame(gas, pm, por)
str(aire)
# Número de columnas ncol(df)
ncol(aire)
# Número de filas nrow(df)
nrow(aire)
# Si quiero saber las dimensiones usamos dim(df) (filas, columnas)
dim(aire)

# Definimos nuestro data.frame
aire <- data.frame(
  gas = c("N2", "O2", "Ar", "CO2"),
  pm = c(2 * 14 , 2 * 16, 40, 12 + 2 * 16),
  por = c(78, 20.9, 0.9, 0.04)
)

# Para seleccionar columnas usamos el $
aire$gas
aire$pm
aire$por

# Para crear una columna usamos df$nueva_columna
aire$nombre <- c("Nitrógeno", "Oxígeno", "Argon", "Dióxido de Carbono")
aire$frac <- aire$por / 100

# Será que tenemos todo los componentes del aire
sum(aire$frac)
aire$gas <- c("n2", "o2", "ar", "co2")
aire$gas_mayuscula <- toupper(aire$gas)

# Para eliminar columnas df$nombre_columna <- NULL
aire$gas_mayuscula <- NULL

# Seleccionar df[indice_fila, indice_columna]
# Seleccionar fila df[numero_de_fila, ]
# Quiero oxigeno
aire[2, ]
# QUiero CO2
aire[4, ]
# Peso molecular CO2
aire[4, 2]

aire[4, "pm"]

# QUiero el nombre y el peso molecular del CO2
aire[4, c("nombre", "pm")]

# Qué pasa si no sé la ubicación, entonce usos los valores
# Filtrar por valores
aire[aire$gas == "o2", ]

# quiero todas las filas que tengan por > 1
aire[aire$por > 1, ]

# Quiero los gases traza
aire[aire$por < 1, ]

# Si sólo quiero los porcentajes
aire[aire$por < 1, c("por")]

# Si sólo quiero los porcentajes y los nombres
aire[aire$por < 1, c("nombre", "por")]

# subset es una forma más saludable de seleccionar datos
#subset(df, subset = CONDICION)
aire_traza <- subset(aire, por < 1)
aire_n2_o2 <- subset(aire, por > 10)

# Cambiando Mayusculas
aire$gas <- toupper(aire$gas)

# Tenemos que reemplazar el nombre de argon
# 1. Selecionar el valor
# 2. Asignar el nuevo valor
aire[3, "gas"] <- "Ar"

# Seleccionar columnas
aire[, c(1, 2)]
aire[, c("gas", "pm")]
# df[indices_filas, indices_columnas ] <- 

aire[1:3, c(3, 2)]

#USEMOS SUBSET
# Para filtar usamos subset,
# Para seleccionar columnas usamos select, 
# Para seleccionar filae subset
aire_N2_O2 <- subset(aire, select = c(nombre, pm),
                     subset= por > 10)
aire_N2_O2

aire_N2 <- subset(aire, select = c("nombre", "pm"),
                  subset = gas == "N2")
# TRANSLATION:
# Quiero que me selecciones del data frame aire, las columnas nombre y pm
# y las filas que la columna gas tengan el valor "N2"

aire_N2_O2 <- subset(aire, select = c(nombre, pm),
                     subset= gas == "N2" | gas == "O2")

# IMPORTANTE:
# Los operadores [ ], son imporntates para SELECCIONAR y MODIFICAR los valores de un data.frame
