##
## This is for constracting original org.MeSH.XXX.db packages by end-users
##

makeGeneMeSHPackage <- function(pkgname,
                                data,
                                metadata,
                                organism,
                                version,
                                maintainer,
                                author,
                                destDir,
                                license="Artistic-2.0"){

   # Validate of data
   .validateColNames1(data)
   .validateColNames2(metadata)

   ## there should only be one template
   template_path <- system.file("GeneMeSHPkg-template", package="MeSHDbi")

   ## We need to define some symbols in order to have the
   ## template filled out correctly.
   symvals <- list(
    PKGTITLE=paste("Annotation package for the",pkgname,"object"),
    PKGDESCRIPTION=paste("Contains the",pkgname,"object",
      "to access data from several related annotation packages."),
    PKGVERSION=version,
    AUTHOR=author,
    MAINTAINER=maintainer,
    LIC=license,
    ORGANISM=organism,
    ORGANISMBIOCVIEW=gsub(" ","_",organism),
    PKGNAME=pkgname
  )

   ## Should never have duplicates
   if (any(duplicated(names(symvals))))
       stop("'symvals' contains duplicated symbols")
   ## All symvals should by single strings (non-NA)
   is_OK <- sapply(symvals, isSingleString)
   if (!all(is_OK)) {
       bad_syms <- paste(names(is_OK)[!is_OK], collapse="', '")
       stop("values for symbols '", bad_syms, "' are not single strings")
   }

   ## create Package structure
   createPackage(pkgname = pkgname,
                 destinationDir = destDir,
                 originDir = template_path,
                 symbolValues = symvals,
                 unlink = TRUE
                 )

   ## move template to dest
   template_sqlite <- paste0(system.file("DBschemas", package = "MeSHDbi"), "/org.MeSH.XXX.db.sqlite")
   dir.create(paste0(destDir, "/", pkgname, "/inst/"))
   dir.create(paste0(destDir, "/", pkgname, "/inst/extdata"))
   dest_sqlitepath <- paste0(destDir, "/", pkgname, "/inst/extdata/")

   file.copy(from = template_sqlite, to = dest_sqlitepath)

   ## rename
   old_dest_sqlite <- paste0(dest_sqlitepath, "org.MeSH.XXX.db.sqlite")
   new_dest_sqlite <- paste0(dest_sqlitepath, pkgname, ".sqlite")
   file.rename(from = old_dest_sqlite, to = new_dest_sqlite)

   # ## connection
   conn <- dbConnect(SQLite(), dbname = new_dest_sqlite)

   ## insert metadata into moved sqlite database
   dbBegin(conn)
   INSERTMETA <- "insert into METADATA values (?, ?)"
   dbGetPreparedQuery(conn, INSERTMETA, bind.data = metadata)
   dbCommit(conn)

   ## insert data and metadata into moved sqlite database
   dbBegin(conn)
   INSERTDATA <- "insert into DATA values (?, ?, ?, ?, ?)"
   dbGetPreparedQuery(conn, INSERTDATA , bind.data = data)
   dbCommit(conn)

   # disconnection
   dbDisconnect(conn)
}

.validateColNames1 <- function(data){
  if(ncol(data) != 5){
    stop("Data should has 5 columns!")
  }
  if(colnames(data)[1] != "GENEID"){
    stop("Please specify the name of 1st column as 'GENEID'")
  }
  if(colnames(data)[2] != "MESHID"){
    stop("Please specify the name of 2nd column as 'MESHID'")
  }
  if(colnames(data)[3] != "MESHCATEGORY"){
    stop("Please specify the name of 3rd column as 'MESHCATEGORY'")
  }
  if(colnames(data)[4] != "SOURCEID"){
    stop("Please specify the name of 4th column as 'SOURCEID'")
  }
  if(colnames(data)[5] != "SOURCEDB"){
    stop("Please specify the name of 5th column as 'SOURCEDB'")
  }
}

.validateColNames2 <- function(metadata){
  if(ncol(metadata) != 2){
    stop("Meta data should has 2 columns!")
  }
  if(colnames(metadata)[1] != "NAME"){
    stop("Please specify the name of 1st column as 'NAME'")
  }
  if(colnames(metadata)[2] != "VALUE"){
    stop("Please specify the name of 2nd column as 'VALUE'")
  }
}



