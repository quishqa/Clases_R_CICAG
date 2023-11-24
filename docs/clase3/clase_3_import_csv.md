---
marp: true
class: invert
math: mathjack
style: |
---

# Curso de R para analísis de calidad de aire y meteorología - Día 3 :sunny: :earth_americas: :factory: 

Mario Gavidia-Calderón
mario.calderon@iag.usp.br

---

## Menú :clipboard:

* ~~Introducción: Por qué R?~~
* ~~Syntaxis básica.~~
* ~~**data.frames**~~
* Importar archivos en R :thumbsup:
* Bonus track: Absolver dudas particulares.
![bg left height:4in](https://scontent.fcgh22-1.fna.fbcdn.net/v/t1.6435-9/138517430_720584161924830_2292600382378387368_n.jpg?stp=cp0_dst-jpg_e15_p320x320_q65&_nc_cat=111&ccb=1-7&_nc_sid=3c63d6&_nc_ohc=O5UnrkYpuuIAX9BtCLF&_nc_ht=scontent.fcgh22-1.fna&oh=00_AfD7obht1ijFnPAGL3VtHLYzBZdt-LNhPfj-STKYXQ5ydA&oe=658309BA)
---
# Dudas clase pasada :question::question::question: :

* Toda la información del curso (presentación, scripts, y ejemplos) están disponibles en:
[https://github.com/quishqa/Clases_R_CICAG](https://github.com/quishqa/Clases_R_CICAG) :gift:
* Cómo seleccionar en un `data.frame` :confused::cold_sweat::scream: 

---
## <!--fit--> Un repaso :eyeglasses:

---
## Importar data frames: `read.table` :incoming_envelope:

* Para leer archivos en R usamos la función **`read.table`**.
* `?read.table`
```r
df <- read.table(ubicacion_de_archivo,
                 sep = ",",
                 dec = ".",
                 header = TRUE)
```
---
## Algunas consideraciones
* De Excel para R: Transformar la hoja de cálculo a **.csv**.
* Evitar caracteres especiales en los nombres de las columnas:
    * Acentos: \`, º ,\~, etc. :no_good: 
    * Nombre completo de columnas: `gases de efecto inveradero`. :-1:
    * Unidades: `temp (k)` :no_good:
* Usar nombres más simples:
    * `tempC` en vez `Temperatura em (ºC)` :+1:
* Sirve para GoogleCalc, LibreOffice, etc.
---
## Date :calendar:

* Los datos de meteorología y calidad de aire, tienen variación temporal (y espacial).
* Necesitamos decirle a R, que no son `character`,  son `POSIXct`
* Importante para calcular diferentes **tipos de médias temporales**.
---

## Date :calendar:

* La estrategia `strptime` + `as.POSIXct`
* con `strptime` convertimos de `character` al formato `POSIXct` 
* Luego con `as.POSIXct` aseguramos que sea del tipo `POSIXct`

---

## Date :date:

```r
hoy <- "24-11-2023 17:05"
hoy_posixct <- as.POSIXct(strptime(hoy, format = "%d-%m-%Y %H:%M"))
class(hoy_posixct)
``` 

---
## <!--fit--> :wave: a la :construction:
