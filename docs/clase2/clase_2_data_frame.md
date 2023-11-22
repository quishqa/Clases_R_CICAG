---
marp: true
class: invert
math: mathjack
style: |
---

# Curso de R para analísis de calidad de aire y meteorología :sunny: :earth_americas: :factory: 

Mario Gavidia-Calderón
mario.calderon@iag.usp.br

---

## Menú

* ~~Introducción: Por qué R?~~
* ~~Syntaxis básica.~~
* **data.frames** :thumbsup:
* Bonus track: Absolver dudas particulares.
![bg left height:4in](https://scontent.fcgh22-1.fna.fbcdn.net/v/t1.6435-9/138517430_720584161924830_2292600382378387368_n.jpg?stp=cp0_dst-jpg_e15_p320x320_q65&_nc_cat=111&ccb=1-7&_nc_sid=3c63d6&_nc_ohc=O5UnrkYpuuIAX9BtCLF&_nc_ht=scontent.fcgh22-1.fna&oh=00_AfD7obht1ijFnPAGL3VtHLYzBZdt-LNhPfj-STKYXQ5ydA&oe=658309BA)
---
## Dudas clase pasada:

* _tengo archivo .txt de datos es mejor pasar a una base de datos SQL antes de trabajar con R o es mejor trabajar directamente con R?_
    * Directo en R, sin miedo al éxito.
* _se puede pasar de rectangular a polar los complejos_
    * Sí se puede: `?complex`
* _cómo saber días julianos_
    * Pasar para tipo `POSIXct`, y usar `format(variable_fecha, "%j")`
* Profe, dónde encontramos los `%j`: [aquí](https://www.programiz.com/python-programming/datetime/strptime)
---
## <!--fit--> Un repaso.

---
## Data Frame

* Un **`data.frame`** es un **tabla**.
* Es una **matriz indexada**: las columnas y filas tienen **nombre**.
* Cada **columna** es una **variable**. :arrow_down_small:
* Cada **fila** es una **observación**. :arrow_forward:
* También es un conjunto de **vectores**.
---

## Qué tenemos que aprender:

* Seleccionar una columna.
* Seleccionar una fila.
* Seleccionar una o más _celdas_.
* Crear una nueva columna.
* Funciones y operaciones básicas.
    * **`subset`**

---
## Operadores **`[ ]`** y **`$`**

* Para seleccionar usamos `[ ]`
* `nombre_data_frame[indice_fila, indice_columna]`
* `nombre_data_frame[vector_indices, vector_indices]`
* `nombre_data_frame$nombre_columna`

---
## Operaciones lógicas

* `TRUE` = 1
* `FALSE`= 0
* Una conjunción es **Y**, en R es **`&`**, equivale a $\times$.
* Una disjunción es **O**, en R es **`|`**, equivale a $+$
---

## Más operadores lógicos

* Mayor o menor qué : `>` , `<`.
* Mayor o menor igual qué: `>=` , `<=`.
* Es igual qué: `==`
* No es igual qué: `!=`

---
## `subset()`

* `?subset`
    * Genera un subconjunto de vectores, matrices, o data frames que **satisfacen las condiciones**.
* **condiciones** son establecidas usando **operaciones lógicas**.
* `subset(data_frame, subset = condiciones)`

---
## <!--fit--> :wave: a la :construction:
