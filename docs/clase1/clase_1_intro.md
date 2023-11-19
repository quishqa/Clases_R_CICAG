---
marp: true
class: invert
math: mathjack
style: |
---

# Clase de R para analísis de calidad de aire y meteorología :sunny: :earth_americas: :factory: 

Mario Gavidia-Calderón

---
## <!--fit-->Hola!

---
## <!--fit-->Maitei!

---
## Sobre el profe

* Post-doctorado en el Instituto de Astronomía, Geofísica y Ciencias Atmosféricas de la Universidad de São Paulo.
* Trabajo con Modelamiento de la calidad de aire: **WRF-Chem**.
* Tengo como 10 años usando R y RStudio.
* También tengo un blog sobre R: [**RandRoll**](https://randroll.wordpress.com/).
* He creado paquetes en R: [**qualR**](https://github.com/ropensci/qualR).
* Analísis y figuras creadas en R.
---

## Sobre el curso 

* What you need to know to start doing ~~physics~~ R.
* **Importar** los datos a R e **manipular** **`data.frames`**. 
* Vamos usar datos  y ejemplos de **calidad de aire** y variables **meteorológicas**.

![bg right height:5in](https://m.media-amazon.com/images/I/71D+KXi-LQL._SY466_.jpg)

---

## Menú

* Introducción: Por qué R?
* Syntaxis básica.
* **data.frames**
* Importar archivos en R.
* Paquetes/Librarías.

---

## R 
* **Lenguaje de programación** para el **análisis de datos**.
   * Un sistema para **estadística**.
   * Un sistema de computación gráfica y **estadística**.
   * Un ambiente para analísis de datos y **estadística**.
---

## Por qué R?
* Es **gratis**.
* Funciona en **cualquier sistema operativo**.
* Una **gran comunidad de usuarios** : Mucha ayuda on-line.
* **Reproducibilidad** de las ciencias!
---
## Por qué R?
* Existen **paquetes** para muchas áreas de las ciencias:
    * `openair` $\rightarrow$ contaminación atmosférica.
    * `sf` y `raster` $\rightarrow$ GIS.
    * `Rmarkdown`$\rightarrow$ Documentos ~ Latex.
    * `shiny` $\rightarrow$ Aplicaciones.
    * *etc, etc, etc ...*

---
## <!--fit--> Preguntas?

---
## RStudio
![](img/rstudio_screenshot.png)

---
## RStudio
* Nostros vamos a movernos entre el **editor** y la **cónsola**.

---
## RStudio
* Nostros vamos a movernos entre el **editor** y la **cónsola**.

---
## RStudio
* Nostros vamos a movernos entre el **editor** y la **cónsola**.
---

## Algunas particularidas de R

* En R usamos `<-` para **asignar** variables:

```r
pi <- 3.14
```
* En RStudio el atajo `Alt + -`
* R acepta `=`, pero no es muy aceptado en la comunidad.

---

## Algunas particularidades de R

* R es _**case-sensitive**_:
$x \neq X$
$pi \neq Pi$
$pi \neq pI$

* Es el causante de los **errores iniciales**.
* **Mucho ojo** cuando sigan los ejemplos.

---

## Algunas particularidades de R

* Para definir la ubicación de archivos en Windows se usa **`/`** y no **`\`**.
```r
setwd(c:/Documentos/my_carpeta_de_trabajo/clase1)
```
* Dentro de RStudio es mejor usar TAB para autocompletar.
---
## Vamos a empezar!
<style>
img[alt~="center"]{
  display: block;
  margin: 0 auto;
}
</style>

![w:640 center](https://qph.cf2.quoracdn.net/main-qimg-41c21b362dba2ddcce3a1b783186e2a1-lq)
