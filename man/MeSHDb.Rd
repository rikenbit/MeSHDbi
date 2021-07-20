\name{MeSHDb-class}
\docType{class}

\alias{MeSHDb-class}
\alias{class:MeSHDb}
\alias{MeSHDb}

% select and select related methods
\alias{columns}
\alias{keytypes}
\alias{keys}
\alias{select}
\alias{dbconn}
\alias{dbfile}
\alias{dbschema}
\alias{dbInfo}
\alias{species}
\alias{nomenclature}
\alias{listDatabases}
\alias{meshVersion}

\alias{columns,MeSHDb-method}
\alias{keytypes,MeSHDb-method}
\alias{keys,MeSHDb-method}
\alias{select,MeSHDb-method}
\alias{dbconn,MeSHDb-method}
\alias{dbfile,MeSHDb-method}
\alias{dbschema,MeSHDb-method}
\alias{dbInfo,MeSHDb-method}
\alias{species,MeSHDb-method}
\alias{nomenclature,MeSHDb-method}
\alias{listDatabases,MeSHDb-method}
\alias{meshVersion,MeSHDb-method}

\title{MeSHDb objects}
\description{
  \code{MeSHDb} is the simple class for providing the relationship between Entrez gene IDs and MeSH IDs. It provides the database connection and easily accessible with \code{columns}, \code{keytypes}, \code{keys} and \code{select}. Some users may use additional functions such as \code{dbconn}, \code{dbfile}, \code{dbschema}, \code{dbInfo}, \code{species}, \code{nomenclature}, \code{listDatabases}, and \code{meshVersion} for much complex data acquisition.

  \code{columns} shows which kinds of data can be returned for the
  \code{MeSHDb} object.

  \code{keytypes} allows the user to discover which keytypes can be
  passed in to \code{select} or \code{keys} and the \code{keytype}
  argument.

  \code{keys} returns keys for the database contained in the
  \code{MeSHDb} object .  This method is already documented in the keys manual page but is mentioned again here because it's usage with
  \code{select} is so intimate.  By default it will return the primary
  keys for the database, but if used with the \code{keytype} argument,
  it will return the keys from that keytype.

  \code{select} will retrieve the data as a data.frame based on
  parameters for selected \code{keys}, \code{columns}, and \code{keytype} arguments.

  \code{dbconn} returns the connection with database in the package.

  \code{dbfile} returns the absolute path sqlite file is saved.

  \code{dbschema} returns the database schema.

  \code{dbInfo} returns the many meta information about the package.

  \code{species} returns the species name.

  \code{nomenclature} returns the scientific name.

  \code{listDatabases} returns the list of databases to correspond Gene ID and MeSH ID.

  \code{meshVersion} returns the version of MeSH.
}
\usage{
  columns(x)
  keytypes(x)
  keys(x, keytype, ...)
  select(x, keys, columns, keytype, ...)
  dbconn(x)
  dbfile(x)
  dbschema(x, file = "", show.indices = FALSE)
  dbInfo(x)
  species(object)
  nomenclature(x)
  listDatabases(x)
  meshVersion(x)
}
\arguments{
  \item{x}{the \code{MeSHDb} object converted by \code{MeSHDbi::MeSHDb}.}

  \item{object}{same as x}

  \item{keys}{the keys to select records for from the database.  All possible keys are returned by using the \code{keys} method.}

  \item{columns}{the columns or kinds of things that can be retrieved from the database. As with \code{keys}, all possible columns are returned by using the \code{columns} method.}

  \item{keytype}{the keytype that matches the keys used. For the
    \code{select} methods, this is used to indicate the kind of ID being used with the keys argument. For the \code{keys} method this is used to indicate which kind of keys are desired from \code{keys}}

  \item{...}{other arguments.}

  \item{file}{The \code{file} argument must be a connection, or a character string naming the file to print to (see the \code{file} argument of the \code{\link[base:cat]{cat}} function for the details).}

  \item{show.indices}{The CREATE INDEX statements are not shown by default. Use \code{show.indices=TRUE} to get them.}
}

\value{
  \code{keys}, \code{columns}, \code{keytypes}, \code{dbfile}, \code{dbInfo}, \code{species}, and \code{nomenclature} each return a character vector or possible values. \code{select}, \code{dbschema}, \code{listDatabases}, and \code{meshVersion} each return a data.frame. \code{dbconn} returns database connection.
}

\author{Koki Tsuyuzaki}

\seealso{
  \code{\link[DBI:dbConnect]{dbConnect}}
}

\examples{
# library("MeSHDbi")
# library("AnnotationHub")

# # Data retrieval from AnnotationHub
# ah <- AnnotationHub()
# dbfile <- query(ah, c("MeSHDb", "Bombyx mori", "v001"))[[1]]

# # Constructor
# MeSH.Sil.eg.db <- MeSHDbi::MeSHDb(dbfile)

# # show
# MeSH.Sil.eg.db

# # dbconn
# dbconn(MeSH.Sil.eg.db)

# # dbfile
# dbfile(MeSH.Sil.eg.db)

# # dbschema
# dbschema(MeSH.Sil.eg.db)

# # dbInfo
# dbInfo(MeSH.Sil.eg.db)

# # species
# species(MeSH.Sil.eg.db)

# # nomenclature
# nomenclature(MeSH.Sil.eg.db)

# # listDatabases
# listDatabases(MeSH.Sil.eg.db)

# # meshVersion
# meshVersion(MeSH.Sil.eg.db)

# # columns
# cols <- columns(MeSH.Sil.eg.db)

# # keytypes
# kys <- keytypes(MeSH.Sil.eg.db)

# # keys
# ks <- keys(MeSH.Sil.eg.db, keytype="GENEID")[seq(10)]

# # select
# out <- select(MeSH.Sil.eg.db,
#   columns=cols,
#   keys=ks,
#   keytype="GENEID")
}