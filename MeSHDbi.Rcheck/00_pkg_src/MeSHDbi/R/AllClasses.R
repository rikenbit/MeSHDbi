##
## Definition of Classes
##

require("methods", quietly = TRUE)

# Reference class
.MeSHDb <- setRefClass("MeSHDb", contains="AnnotationDb")


## Constructor 
MeSHDb <- function(pkgname){

  ## Inherit class, Instantiation
  .dbconn <- RSQLite::dbConnect(
              RSQLite::SQLite(), 
              paste0(
                system.file(c("inst", "extdata"), package=pkgname),
                paste0("/", pkgname, ".sqlite")
              )
            )

  obj <- .MeSHDb$new(conn=.dbconn, packageName=pkgname)
  return(obj)
}
