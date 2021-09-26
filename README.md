
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gobmx

<!-- badges: start -->
<!-- badges: end -->

Paleta de colores asociadas a instituciones del Gobierno de México. Es
una copia de la de
[`Wes Anderson`](https://github.com/karthik/wesanderson) pero con los
colores institucionales vigentes en 2021. **NO ES UN PRODUCTO OFICIAL**.

## Instalación

Puedes instalar desde Github haciendo

``` r
devtools::install_github("RodrigoZepeda/gobmx")
```

para llamarla a tu sesión actual:

``` r
library(gobmx)
```

## Ejemplo

La paleta funciona mediante `gobmx_palette` donde puedes especificar si
deseas una paleta discreta (en general tienen pocos colores excepto
`Federal` y `CDMX2`) o bien una continua que interpola valores entre
dichos colores. Las paletas disponibles son las siguientes:

``` r
names(gobmx_palettes)
#> [1] "Federal"      "FederalLight" "FederalDark"  "IMSS"         "CDMX1"       
#> [6] "CDMX2"
```

``` r
library(gobmx)
## basic example code
```

# Gobierno Federal

``` r
gobmx_palette("Federal")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

# Gobierno Federal (sólo tonos oscuros)

``` r
gobmx_palette("FederalDark")
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

# Gobierno Federal (sólo tonos claros)

``` r
gobmx_palette("FederalDark")
```

<img src="man/figures/README-unnamed-chunk-8-1.png" width="100%" />

# IMSS

``` r
gobmx_palette("IMSS")
```

<img src="man/figures/README-unnamed-chunk-9-1.png" width="100%" />

# CDMX 1

``` r
gobmx_palette("CDMX1")
```

<img src="man/figures/README-unnamed-chunk-10-1.png" width="100%" />

# CDMX 2

``` r
gobmx_palette("CDMX2")
```

<img src="man/figures/README-unnamed-chunk-11-1.png" width="100%" />

# Ejemplos

``` r
library(ggplot2)
pal   <- gobmx_palette("FederalLight", 32, type = "continuous")
datos <- data.frame(y = rnorm(32), Estado = as.factor(1:32))
ggplot(datos, aes(x = Estado, y = y)) +
  geom_col(aes(fill = Estado)) +
  scale_fill_manual(values = pal) +
  theme_classic() +
  theme(legend.position = "none")
```

<img src="man/figures/README-unnamed-chunk-12-1.png" width="100%" />
