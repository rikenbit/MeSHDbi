\name{nomenclature}
\docType{methods}

\alias{generic,nomenclature}
\alias{nomenclature,MeSHDb-method}
\alias{nomenclature}

\title{A function to return the scientific name of package}
\description{This function returns the scientific name of species used in the package.}

\usage{nomenclature(x)}

\arguments{
\item{x}{\code{MeSHDb} object such as \code{org.MeSH.Mmu.db}}
}
\author{Koki Tsuyuzaki}
\examples{
# library("org.MeSH.Mmu.db")
# nomenclature(org.MeSH.Mmu.db)
}