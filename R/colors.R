#' Complete list of palettes
#'
#' Use \code{\link{gobmx_palette}} to construct palettes of desired length.
#'
#' @export
gobmx_palettes <- list(
  `Federal`      = c("#10312B","#235B4E","#98989A","#6F7271",
                     "#BC955C", "#DDC9A3", "#9F2241","#691C32"),
  `FederalLight` = c("#9F2241","#235B4E","#DDC9A3","#98989A"),           #https://www.gob.mx/wikiguias/articulos/manual-de-identidad-grafica-2018-2024
  `FederalDark`  = c("#691C32","#10312B","#BC955C","#6F7271"),           #https://www.gob.mx/wikiguias/articulos/manual-de-identidad-grafica-2018-2024
  `IMSS`         = c("#134E39","#8E908F"),                               #http://www.imss.gob.mx/sites/all/statics/pdf/manualesynormas/G000-001-001.pdf
  `CONEVAL`      = c("#21409A","#00A94F"),                       #https://www.coneval.org.mx/Normateca/NormatividadInterna/Documents/Manual-de-identidad-CONEVAL.pdf
  `INAI`         = c("#296153","#4F1C6C","#9136CC","#D04EED","#C2C2C2"),                       #https://www.coneval.org.mx/Normateca/NormatividadInterna/Documents/Manual-de-identidad-CONEVAL.pdf
  `CDMX1`        = c("#00b140","#0f4c42","#91d400","#00843d","#009288"), #https://www.transparencia.cdmx.gob.mx/storage/app/uploads/public/5cc/b12/d87/5ccb12d87a046038647965.pdf
  `CDMX2`        = c("#2b2287","#174a80","#1e67ad","#7343be","#cb2833",
                     "#d44787", "#ec95c5","#ffc200","#fca800","#ae8156",
                     "#6b4c2a"),                                          #https://www.transparencia.cdmx.gob.mx/storage/app/uploads/public/5cc/b12/d87/5ccb12d87a046038647965.pdf
  `INEGI`        = c("#27251F","#003057","#706F6F","#0077C8") #https://sc.inegi.org.mx/repositorioNormateca/ODm_22Ene19.pdf
)

#' A palette generator for colors associated with the Mexican government
#'
#' These are a handful of color palettes from the Mexican government including
#' the federal graphical identity \href{https://www.gob.mx/wikiguias/articulos/manual-de-identidad-grafica-2018-2024}{Manual de identidad gráfica}.
#' the graphical identity from \href{https://www.transparencia.cdmx.gob.mx/storage/app/uploads/public/5cc/b12/d87/5ccb12d87a046038647965.pdf}{Mexico City}
#' Please help us add  your favourite government branch by sending the
#' norm or graphical identity associated with it.
#' @param n Number of colors desired. Most palettes have 4 colors.
#'
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{FederalDark}, \code{FederalLight},  \code{IMSS}, \code{CDMX1},
#'   \code{CDMX2}, \code{INAI}, \code{INEGI}, and \code{CONEVAL}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' gobmx_palette("CDMX1")
#' gobmx_palette("FederalLight")
#' gobmx_palette("CDMX2", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- gobmx_palette(21, name = "IMSS", type = "continuous")
#' image(volcano, col = pal)
gobmx_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- gobmx_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
