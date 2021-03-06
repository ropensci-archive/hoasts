% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hoa_vertnet.R
\name{hoa_vertnet}
\alias{hoa_vertnet}
\title{Vertnet}
\usage{
hoa_vertnet(x, limit = 500, ...)
}
\arguments{
\item{x}{(character) a scientific name}

\item{limit}{(numeric) number records to get. default: 500}

\item{...}{curl options}
}
\description{
Vertnet
}
\examples{
\dontrun{
hoa_vertnet("Remora remora", limit = 50)
hoa_vertnet("Remora remora")
}
}

