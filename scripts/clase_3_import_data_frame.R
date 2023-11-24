# REPASO
beatles <- c("John", "Paul", "Ringo", "George")

# Para selecionar usamos los corchetes [ ]
beatles[1] # John

# Selecionar por condiciones
beatles[beatles == "Paul"]

# un vector com NA
vector_con_NA <- c(1, 2, 4, 7, 10, 100, NA, 50, 21, 5, 5, 5, NA)
vector_con_NA[vector_con_NA == 5]

# Seleccionar los na
vector_con_NA[is.na(vector_con_NA)]
vector_con_NA[is.na(vector_con_NA)] <- 0

# La moraleja de la historia 
# es que filtrados complejos se pueden usando condicionales
# No solamente los indices

vector_con_NA[vector_con_NA > 5]
# TRADUCCIóN: del vector_con_NA, quiero que selecciones,
# los valores_con_NA que son mayores a 5.

# Operaciones con vectores: VECTORIZADAS
# QUe no se requires loop para operar en cada elemento
tempC <- c(32, 28, 27, 29, 19)
tempK <- tempC + 273
o3_ppm <- c(.080, .070, .060, .095) 
o3_ppb <- o3_ppm * 1000
beatles
toupper(beatles) # MAYUSCULAS
tolower(beatles) # MINUSCULAS

# Adicionar un elemento a un vector
beatles_mario <- c(beatles, "mario")

# nuestro dataframe aire
gas <- c("N2", "O2", "Ar", "CO2")
pm <- c(2 * 14 , 2 * 16, 40, 12 + 2*16)

aire <- data.frame(gas, pm)
str(aire)

# Agregar una columna $
aire$nombre <- c("Nitrogeno", "Oxigeno", "Argon", "Dioxido de carbono")

# Cómo adicionar una fila
# crear un data frame de una fila, usar rbind
neon <- data.frame(gas = "Ne", pm = 20.18, nombre = "Neon")

aire <- rbind(aire, neon)

ncol(aire)
nrow(aire)
dim(aire)
names(aire)
length(aire) # En un dataframe resulta el numero de columnas

# Seleccionar elementos de un data.frame
# el orden influye
aire$por <- c(78, 20.9, 0.9, 0.04, 0.018)
helio <- data.frame(nombre = "Helio", pm = 4, gas = "He", 
                    por = 0.0005)
aire <- rbind(aire, helio) # que primero van las filas del df aire
                           # el orden columnas no importa.

# Seleccion
# Selecionar la última fila del data.frame
aire[6, ]
aire[6, "pm"]

aire[aire$gas == "O2", ]
# TRADUCCiÒN: " " todo
# del df aire, seleciona la fila que tiene O2 em la coluna gas,
# todas las columnsa

# Selecionar columnas
aire$pm
aire["pm"]

aire[1, "nombre"]
aire[c(1, 6), c(2, 4)]
aire[aire$por > 10, ]

# Data.frame test
SP <- data.frame(dias = seq(1, 30),
                 tempC = runif(30, 20, 30))
# Si yo sé que los valores mayores a 28 mal equipo
# Son NA
SP$tempC[SP$tempC > 28] <- NA

