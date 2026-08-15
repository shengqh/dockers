
library(AnnotationHub)
library(ensembldb)

annotationhub_cache=Sys.getenv("ANNOTATIONHUB_CACHE")
cat("AnnotationHub cache directory: ", annotationhub_cache, "\n")

setAnnotationHubOption("CACHE", annotationhub_cache)

ah <- AnnotationHub()

edb = query(ah, c("EnsDb", "Homo sapiens", "113"))
edb <- edb[[1]]

genes(
    edb,
    filter = AnnotationFilterList(GeneNameFilter(c("ATM")),
                                  GeneBiotypeFilter("protein_coding")),
    return.type = "DataFrame"
)
