#' Search
#'
#' @export
#' @param x (character) a scientific name
#' @param from (character) One of 'gbif', 'vertnet' or others (to come later)
#' @param limit (numeric) number records to get. default: 500
#' @param ... curl options
#' @examples \dontrun{
#' hoa_search(x = "Remora remora", from = "gbif")
#' }
hoa_search <- function(x, from = "gbif", limit = 500, ...) {
  stopifnot(from %in% c('gbif', 'vertnet'))
  switch(
    from,
    gbif = hoa_gbif(x = x, limit = limit, ...),
    vertnet = hoa_vertnet(x = x, limit = limit, ...)
  )
}

# key <- rgbif::name_suggest(q = q, rank = 'species')$key[1]
# res <- rgbif::occ_data(taxonKey = key, limit = 2000)
# #res <- occ_data(search = "host", limit = 1500)
#
# # select only columns that have 'host' in any cell
# df <- res$data[, apply(res$data, 2, function(x) length(grep("host", x, ignore.case = TRUE, value = TRUE))) != 0]
#
# # select only columns of interest for host data
# df <- dplyr::filter(df, grepl("host", occurrenceRemarks) | grepl("host", associatedTaxa))
# #filter(grepl("host", occurrenceRemarks))
#
# df