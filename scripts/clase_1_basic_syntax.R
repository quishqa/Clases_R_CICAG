# R puede ser una calculdora
1 + 3
3 * 5
2^2

# R sigue el orden de las operaciones
1 + 2 * 2 / 4

# Para asignar una variable
# Los comentarios se hacen con #
my_age <- 35
my_name <- "mario" # palabras entre "" o ''
g <- 9.81

# Para usar una función: nombre_funcion()
class(my_age)
class(my_name)

# Numeros complejos
my_complex <- complex(real = 3, imaginary = 5)
my_complex
class(my_complex)

# Podemos assignar una 'operación' a una variable
my_age <- 2023 - 1988

# Podemos usar las variables para hacer operaciones
this_year <- 2023
year_born <- 1988
mi_edad <- this_year - year_born

# Un vector se define usando la función c(elemento1, elemento2, elemento3)
puntos_cardinales <- c("N", "E", "S", "W")
puntos_cardinales_grados <- c(0, 90, 180, 270)

# Para selecionar un elemento de un vector: vector[posición_elemento]
# Norte
puntos_cardinales[1]

# Oeste
puntos_cardinales[4]

# Si quiero quitar un elemento: nombre_vector[-posición_elemento]
# Sin Oeste
puntos_cardinale[-4]

# Reemplazar un elemento del vector
gee <- c("H2O", "CO2", "CH4", "O2")
# O2 no es gee, O3 sí, entonces lo reemplazamos
gee[4] <- "O3"
gee

# Un vector también puede tener operaciones
gee_pm <- c(2 + 2 * 16, 14 + 2 * 16, 14 + 4,
            2 * 16)

# Un data frame es una tabla
# Es una matriz indexada: Columnas con nombres
# En R usamos data.frame() para crear data.frame
aire <- data.frame(
  gas = c("N2", "O2", "Ar", "CO2"),
  pm = c(14, 36, 40, 14 + 2 * 16),
  per = c(78, 21, 0.9, 0.04)
)

# Para seleccionar columnas usamos '$'
aire$gas
aire$pm
aire$per

# Para explorar un dataframe usamos: str(nombre_dataframe)
str(aire)

# Para pedir ayuda: ?nombre_función
?str
