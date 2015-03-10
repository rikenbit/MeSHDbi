\name{makeGeneMeSHPackage}

\alias{makeGeneMeSHPackage}

\title{
  Making MeSHDb packages from corresponding table as single data frame.
}
\description{
 \code{makeGeneMeSHPackage} is a method that generates a package
  that will load an appropriate \code{MeSHDb} object that
  will in turn point to existing annotation packages.
}
\usage{
makeGeneMeSHPackage(pkgname,
					data,
          metadata,
          organism,
					version,
					maintainer,
					author,
					destDir,
					license="Artistic-2.0")
}
\arguments{
  \item{pkgname}{What is the desired package name.}
  \item{data}{Data frame contains GENEID (e.g., 100036770), MESHID (e.g.D000465), CATEGORY (e.g., G), SOURCEID (pubmed id), and SOURCEDB (e.g., gendoo)}
  \item{metadata}{Data frame contains metadata of the package}
  \item{organism}{The name of the organism this package represents}
  \item{version}{What is the version number for this package?}
  \item{maintainer}{Who is the package maintainer? (must include email to be valid)}
  \item{author}{Who is the creator of this package?}
  \item{destDir}{A path where the package source should be assembled.}
  \item{license}{What is the license (and it's version)}
}

\details{
  The purpose of this method is to create a special package that will
  depend on existing annotation packages and which will load a special
  \code{MeSHDb} object that will allow proper dispatch of
  special select methods.  These methods will allow the user to easily
  query across multiple annotation resources via information contained
  by the \code{MeSHDb} object. Because the end result will
  be a package that treats all the data mapped together as a single
  source, the user is encouraged to take extra care to ensure that the
  different packages used are from the same build etc.
}

\value{A special package to load an \link{MeSHDb} object.}

\author{Koki Tsuyuzaki}

\seealso{
  \code{\link{MeSHDb}}
}

\examples{
## makeGeneMeSHPackage enable users to construct
## user's own custom MeSH package

## this is test data which means the relationship between
## Entrez gene IDs of Pseudomonas aeruginosa PAO1
## and its MeSH IDs.
data(PAO1)
head(PAO1)

# We are also needed to prepare meta data as follows.
data(metaPAO1)
metaPAO1

## sets up a temporary directory for this example
## (users won't need to do this step)
destination <- tempfile()
dir.create(destination)

## makes an Organism package for human called Homo.sapiens
makeGeneMeSHPackage(pkgname = "org.MeSH.Pae.db",
					data = PAO1,
          metadata = metaPAO1,
					organism = "Pseudomonas aeruginosa PAO1",
					version = "1.0.0",
					maintainer = "Koki Tsuyuzaki <k.t.the-answer@hotmail.co.jp>",
					author = "Koki Tsuyuzaki",
					destDir = destination,
					license="Artistic-2.0")
}


