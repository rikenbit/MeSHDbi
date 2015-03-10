\name{PAO1}
\alias{PAO1}
\docType{data}
\title{
Data to construct user's original MeSHDb package
}
\description{
Correspondance between Entrez gene IDs of Pseudomonas aeruiginosa PAO1 and MeSH IDs is provided as demo data. This is to demonstrate how to construct user's original \code{MeSHDb} package. The data is based on 
reciprocal BLASTP best hit (E-value < 200) against Bacillus subtilis subsp. spizizenii str. 168.
}

\usage{data(PAO1)}

\details{
\itemize{
 \item 1st Column: Entrez gene ID
 \item 2nd Column: MeSH ID
 \item 3rd Column: MeSH Category
 \item 4th Column: Source ID. In this case, this is the Entrez gend ID of Bacillus subtilis subsp. spizizenii str. 168
 \item 5th Column: Source Database. In this case, species name.
}
}
\examples{
data(PAO1)
head(PAO1)
}

\keyword{datasets}