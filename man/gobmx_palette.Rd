% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colors.R
\name{gobmx_palette}
\alias{gobmx_palette}
\title{A palette generator for colors associated with the Mexican government}
\usage{
gobmx_palette(name, n, type = c("discrete", "continuous"))
}
\arguments{
\item{name}{Name of desired palette. Choices are:
\code{FederalDark}, \code{FederalLight},  \code{IMSS}, \code{CDMX1} and
\code{CDMX2}}

\item{n}{Number of colors desired. Most palettes have 4 colors.

  If omitted, uses all colours.}

\item{type}{Either "continuous" or "discrete". Use continuous if you want
to automatically interpolate between colours.
@importFrom graphics rgb rect par image text}
}
\value{
A vector of colours.
}
\description{
These are a handful of color palettes from the Mexican government including
the federal graphical identity \href{https://www.gob.mx/wikiguias/articulos/manual-de-identidad-grafica-2018-2024}{Manual de identidad gráfica}.
the graphical identity from \href{https://www.transparencia.cdmx.gob.mx/storage/app/uploads/public/5cc/b12/d87/5ccb12d87a046038647965.pdf}{Mexico City}
Please help us add  your favourite government branch by sending the
norm or graphical identity associated with it.
}
\examples{
gobmx_palette("CDMX1")
gobmx_palette("FederalLight")
gobmx_palette("CDMX2", 3)

# If you need more colours than normally found in a palette, you
# can use a continuous palette to interpolate between existing
# colours
pal <- gobmx_palette(21, name = "IMSS", type = "continuous")
image(volcano, col = pal)
}
\keyword{colors}
