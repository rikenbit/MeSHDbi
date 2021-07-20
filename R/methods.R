##
## Definition of Methods
##

## helper for vector dividing
.div <- function(x,d=1) {
  y <- list()
  delta <- ceiling(length(x) / d)
  for(i in 1:d){
    y[[i]] <- as.vector(na.omit(x[((i-1)*delta+1):(i*delta)]))
  }
  return(y)
}

setMethod("show",
  "MeSHDb",
    function(object) {
        print("##### class ####")
        print(class(object))
        print("##### connection #####")
        print(object$conn)
        print("##### sqlite file #####")
        print(object$dbfile)
    }
)

# columns
setMethod("columns",
  "MeSHDb",
  function(x) {
    return(dbGetQuery(dbconn(x),"PRAGMA TABLE_INFO(DATA);")$name)
  }
)

# keytypes
setMethod("keytypes",
  "MeSHDb",
  function(x) {
    return(dbGetQuery(dbconn(x),"PRAGMA TABLE_INFO(DATA);")$name)
  }
)

# keys
setMethod("keys",
  "MeSHDb",
  function(x, keytype){
    query <- paste0("SELECT ", keytype, " FROM DATA;")
    k     <- unlist(unique(dbGetQuery(x$conn, query)))
    names(k) <- NULL
    return(k)
  }
)

# select
setMethod("select",
  "MeSHDb",
  function(x, keys, columns, keytype) {
    if (length(columns) > 1) {
      c <- columns[1]
for (i in 2:(length(columns))){
    c <- paste(c, columns[i], sep = ",")
}
    } else {
      c <- columns
    }

    keys <- paste0('"', keys, '"')
    ke <- paste(keytype, keys, sep ="=")
    kee <- c()
    if (length(ke) > 1)  {
      if(length(ke) >= 1000) {
        ke_loc <- .div(1:length(ke), ceiling(length(keys)/500))
        for(j in 1:ceiling(length(keys)/500)){
          kee[j] <- paste(ke[ke_loc[[j]]], sep="",collapse=" OR ")
        }
      } else {
        kee <- paste(ke, sep="", collapse=" OR ")
      }
    } else {
      kee <- ke
    }

    # SQLs
    kk <- c()
    for(i in 1:length(kee)) {
      query <- paste0("SELECT ", c, " FROM DATA WHERE ", kee[i])
      k <- dbGetQuery(x$conn, query)
      kk <- rbind(kk, k)
    }
    return(unique(kk))
  }
)


## dbconn
setMethod("dbconn",
  "MeSHDb",
  function(x){
    return(x$conn)
  }
)

## dbfile
setMethod("dbfile",
  "MeSHDb",
  function(x){
    return(x$dbfile)
  }
)

## dbschema
setMethod("dbschema",
  "MeSHDb",
  function(x){
  return(dbGetQuery(x$conn, "SELECT * FROM sqlite_master;")$sql)
  }
)

## dbInfo
setMethod("dbInfo",
  "MeSHDb",
  function(x){
    return(dbGetQuery(x$conn, "SELECT * FROM METADATA;"))
  }
)

## species
setMethod("species",
  "MeSHDb",
  function(object) {
    return(dbGetQuery(object$conn, 'SELECT value FROM METADATA where name = "SPECIES";')[1,])
  }
)

## nomenclature
setMethod("nomenclature",
  "MeSHDb",
  function(x) {
    return(dbGetQuery(x$conn, 'SELECT value FROM METADATA where name = "ORGANISM";')[1,])
  }
)

## listDatabases
setMethod("listDatabases",
  "MeSHDb",
  function(x) {
    return(dbGetQuery(x$conn, 'SELECT DISTINCT SOURCEDB FROM DATA;'))
  }
)

## meshVersion
setMethod("meshVersion",
  "MeSHDb",
  function(x){
    return(dbGetQuery(x$conn, 'SELECT * FROM METADATA where name = "MESHVERSION";')[1,])
  }
)
