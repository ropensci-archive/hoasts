#' Vertnet
#'
#' @export
#' @param x (character) a scientific name
#' @param limit (numeric) number records to get. default: 500
#' @param ... curl options
#' @examples \dontrun{
#' hoa_vertnet("Remora remora", limit = 50)
#' hoa_vertnet("Remora remora")
#' }
hoa_vertnet <- function(x, limit = 500, ...) {
  res <- rvertnet::vertsearch(taxon = x, limit = limit, ...)$data
  oc <- dplyr::filter_(res, "!is.na(occurrenceremarks)")
  oc <- dplyr::select_(oc, "occurrenceremarks", "occurrenceid")
  er <- dplyr::filter_(res, "!is.na(eventremarks)")
  er <- dplyr::select_(er, "eventremarks", "occurrenceid")
  list(occ_remarks = oc, ev_remarks = er)
}
