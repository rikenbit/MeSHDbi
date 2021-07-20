library("MeSHDbi")
library("AnnotationHub")

# Data retrieval from AnnotationHub
ah <- AnnotationHub()
dbfile <- query(ah, c("MeSHDb", "Bombyx mori", "v001"))[[1]]

# Constructor
MeSH.Sil.eg.db <- MeSHDbi::MeSHDb(dbfile)

# show
MeSH.Sil.eg.db

# dbconn
expect_true("SQLiteConnection" %in% is(dbconn(MeSH.Sil.eg.db)))

# dbfile
expect_true(dbfile(MeSH.Sil.eg.db) != "")

# dbschema
expect_true(all(dbschema(MeSH.Sil.eg.db) != ""))

# dbInfo
expect_true(all(dim(dbInfo(MeSH.Sil.eg.db)) != 0))

# species
expect_true(species(MeSH.Sil.eg.db) != "")

# nomenclature
expect_true(nomenclature(MeSH.Sil.eg.db) != "")

# listDatabases
expect_true(all(dim(listDatabases(MeSH.Sil.eg.db)) != 0))

# meshVersion
expect_true(all(dim(meshVersion(MeSH.Sil.eg.db)) != 0))

# columns
cols <- c("GENEID", "MESHCATEGORY", "MESHID", "SOURCEDB", "SOURCEID")
expect_identical(sort(columns(MeSH.Sil.eg.db)), sort(cols))

# keytypes
kts <- cols
expect_identical(sort(keytypes(MeSH.Sil.eg.db)), sort(kts))

# keys
ks <- keys(MeSH.Sil.eg.db, keytype="GENEID")[seq(10)]
expect_equal(
	length(ks),
	10)

# select
out <- select(MeSH.Sil.eg.db,
	columns=cols,
	keys=ks,
	keytype="GENEID"
	)
expect_true(all(dim(out) != 0))
