##
## This is for MeSH.db, MeSH.AOR.db, MeSH.PCR.db, and org.MeSH.XXX.db
##

.loadMeSHDbiPkg <- function (pkgname) {

  ## Inherit class, Instantiation
  obj <- MeSHDb(pkgname)

  ## Export object
  ns <- asNamespace(pkgname)
  assign(pkgname, obj, envir=ns)
  namespaceExport(ns, pkgname)
}
