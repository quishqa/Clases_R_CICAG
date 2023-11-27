---
marp: true
class: invert
math: mathjack
style: |
---

# Curso de R para analísis de calidad de aire y meteorología - Día 4 :sunny: :earth_americas: :factory: 

Mario Gavidia-Calderón
mario.calderon@iag.usp.br

---

## Menú :clipboard:

* ~~Introducción: Por qué R?~~
* ~~Syntaxis básica.~~
* ~~**data.frames**~~
* ~~Importar archivos en R~~ 
* Paquetes/Librerias :point_left:
* Bonus track: Absolver dudas particulares.
![bg left height:4in](https://scontent.fcgh22-1.fna.fbcdn.net/v/t1.6435-9/138517430_720584161924830_2292600382378387368_n.jpg?stp=cp0_dst-jpg_e15_p320x320_q65&_nc_cat=111&ccb=1-7&_nc_sid=3c63d6&_nc_ohc=O5UnrkYpuuIAX9BtCLF&_nc_ht=scontent.fcgh22-1.fna&oh=00_AfD7obht1ijFnPAGL3VtHLYzBZdt-LNhPfj-STKYXQ5ydA&oe=658309BA)
---
# Dudas clase pasada :question::question::question: :

* Toda la información del curso (presentación, scripts, y ejemplos) están disponibles en:
[https://github.com/quishqa/Clases_R_CICAG](https://github.com/quishqa/Clases_R_CICAG) :gift:

---
## <!--fit--> Un repaso :eyeglasses:

---
## Packages everywhere

"All the easy problem have already been solve"
_(The Turing Way)_

---
## Packages everywhere
"All the easy problem have already beem solve ...**(by a package)**"

---
## Packages everywhere
- **raster**: Para trabajar con los datos `tif` y `netcdf`. :satellite:
- **sf**: Casi ArcGis. :earth_americas:
- **openair**: Para trabajar con datos de contaminación atmosférica. :factory:
- **reim**: Bajar datos METAR. :airplane:
- Qué dice el público? :microphone:
---
## Packages everywhere
- Para instalar: `install.packages("nombre_del_paquete")` :cd:
- Es muy probable que ya exista un _package_ para resolver tu problema.:grining:
---
## <!--fit--> :hand: al :computer:

