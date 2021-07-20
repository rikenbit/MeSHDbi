.onAttach <- function(libname, pkgname){
    msg <- paste(
        "MeSH-related packages",
        "(MeSH.XXX.eg.db, MeSH.db, MeSH.AOR.db, and MeSH.PCR.db)",
        "are deprecated since Bioconductor 3.14.",
        "Use AnnotationHub instead. For details,",
        "check the vignette of MeSHDbi"
        )
    packageStartupMessage(msg)
}
