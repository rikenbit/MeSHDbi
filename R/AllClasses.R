##
## Definition of Classes
##

require("methods", quietly = TRUE)

# Reference class
.MeSHDb <- setRefClass("MeSHDb",
    contains="AnnotationDb",
    fields=list(
      conn="SQLiteConnection",
      dbfile="character"))

## Constructor 
MeSHDb <- function(dbfile){
  ## Inherit class, Instantiation
  .dbconn <- RSQLite::dbConnect(
              RSQLite::SQLite(),
              dbfile
            )
  obj <- .MeSHDb$new(conn=.dbconn, dbfile=dbfile)
  return(obj)
}
