\name{meshVersion}
\docType{methods}

\alias{generic,meshVersion}
\alias{meshVersion,MeSHDb-method}
\alias{meshVersion}

\title{A function to return the MeSH version of package}
\description{This function returns the version of MeSH used in the package.}

\usage{meshVersion(x)}

\arguments{
\item{x}{\code{MeSHDb} object such as \code{org.MeSH.Mmu.db}}
}
\author{Koki Tsuyuzaki}
\examples{
# library("org.MeSH.Mmu.db")
# meshVersion(org.MeSH.Mmu.db)
}