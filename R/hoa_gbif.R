#' GBIF
#'
#' @export
#' @param x (character) a scientific name
#' @param limit (numeric) number records to get. default: 500
#' @param ... curl options
#' @examples \dontrun{
#' res <- hoa_gbif(x = "Remora remora")
#' res$occ_remarks
#' res$ev_remarks
#' library(dplyr)
#' full_join(res$occ_remarks, res$ev_remarks, by = "key")
#' }
hoa_gbif <- function(x, limit = 500, ...) {
  res <- rgbif::occ_data(scientificName = x, limit = limit, ...)$data
  oc <- dplyr::filter_(res, "!is.na(occurrenceRemarks)")
  oc <- dplyr::select_(oc, "occurrenceRemarks", "key")
  er <- dplyr::filter_(res, "!is.na(eventRemarks)")
  er <- dplyr::select_(er, "eventRemarks", "key")
  list(occ_remarks = oc, ev_remarks = er)
}
