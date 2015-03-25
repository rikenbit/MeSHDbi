pkgname <- "MeSHDbi"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('MeSHDbi')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("MeSHDb")
### * MeSHDb

flush(stderr()); flush(stdout())

### Name: MeSHDb-class
### Title: MeSHDb objects
### Aliases: MeSHDb-class class:MeSHDb MeSHDb columns keytypes keys select
###   dbconn dbfile dbschema dbInfo species columns,MeSHDb-method
###   keytypes,MeSHDb-method keys,MeSHDb-method select,MeSHDb-method
###   dbconn,MeSHDb-method dbfile,MeSHDb-method dbschema,MeSHDb-method
###   dbInfo,MeSHDb-method species,MeSHDb-method

### ** Examples

# # load a package that creates an MeSHDb object
# library(org.MeSH.Mmu.db)
# org.MeSH.Mmu.db

# ## then the methods can be used on this object.
# cls <- columns(org.MeSH.Mmu.db)
# cls
# kts <- keytypes(org.MeSH.Mmu.db)
# kt <- kts[2]
# kts
# ks <- head(keys(org.MeSH.Mmu.db, keytype=kts[2]))
# ks
# res <- select(org.MeSH.Mmu.db, keys=ks, columns=cls, keytype=kt)
# head(res)

# dbconn(org.MeSH.Mmu.db)
# dbfile(org.MeSH.Mmu.db)
# dbschema(org.MeSH.Mmu.db)
# dbInfo(org.MeSH.Mmu.db)
# species(org.MeSH.Mmu.db)



cleanEx()
nameEx("PAO1")
### * PAO1

flush(stderr()); flush(stdout())

### Name: PAO1
### Title: Data to construct user's original MeSHDb package
### Aliases: PAO1
### Keywords: datasets

### ** Examples

data(PAO1)
head(PAO1)



cleanEx()
nameEx("listDatabases")
### * listDatabases

flush(stderr()); flush(stdout())

### Name: listDatabases
### Title: A function to return the scientific name of package
### Aliases: generic,listDatabases listDatabases,MeSHDb-method
###   listDatabases

### ** Examples

# library("org.MeSH.Mmu.db")
# listDatabases(org.MeSH.Mmu.db)



cleanEx()
nameEx("makeMeSHPackage")
### * makeMeSHPackage

flush(stderr()); flush(stdout())

### Name: makeGeneMeSHPackage
### Title: Making MeSHDb packages from corresponding table as single data
###   frame.
### Aliases: makeGeneMeSHPackage

### ** Examples

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



cleanEx()
nameEx("meshVersion")
### * meshVersion

flush(stderr()); flush(stdout())

### Name: meshVersion
### Title: A function to return the MeSH version of package
### Aliases: generic,meshVersion meshVersion,MeSHDb-method meshVersion

### ** Examples

# library("org.MeSH.Mmu.db")
# meshVersion(org.MeSH.Mmu.db)



cleanEx()
nameEx("metaPAO1")
### * metaPAO1

flush(stderr()); flush(stdout())

### Name: metaPAO1
### Title: Metadata to construct user's original MeSHDb package
### Aliases: metaPAO1
### Keywords: datasets

### ** Examples

data(metaPAO1)
head(metaPAO1)



cleanEx()
nameEx("nomenclature")
### * nomenclature

flush(stderr()); flush(stdout())

### Name: nomenclature
### Title: A function to return the scientific name of package
### Aliases: generic,nomenclature nomenclature,MeSHDb-method nomenclature

### ** Examples

# library("org.MeSH.Mmu.db")
# nomenclature(org.MeSH.Mmu.db)



cleanEx()
nameEx("packageName")
### * packageName

flush(stderr()); flush(stdout())

### Name: packageName
### Title: A function to return the name of package
### Aliases: generic,packageName packageName,MeSHDb-method packageName

### ** Examples

# library("org.MeSH.Mmu.db")
# packageName(org.MeSH.Mmu.db)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
