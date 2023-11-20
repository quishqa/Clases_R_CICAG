library(openair)

asu <- read.table("data/SGAS.csv", header = TRUE,
                  sep = ",")
asu$tc <- (asu$tmpf - 32 ) * 5 / 9
asu$ws <- asu$sknt * 0.51
asu$wd <- asu$drct
asu$ws[asu$ws > 100] <- NA
windRose(asu, angle = 45, paddle = FALSE)
windRose(asu, angle = 45, paddle = FALSE,
         breaks = c(0, 0.5, 2.4, 3.6, 5.7, 8.8, 11.1),
         key.position = "right")
