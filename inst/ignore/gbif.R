# library(dplyr)
#
# (key <- name_suggest(q='Varroa destructor', rank='species')$key[1])
# #res <- occ_search(taxonKey=key, limit=500, search = "host")
# (res <- occ_search(taxonKey=key, limit=500))
# res$data[, apply(res$data, 2, function(x) length(grep("host", x, ignore.case = TRUE, value = TRUE))) != 0] %>%
#   filter(grepl("host", occurrenceRemarks))
#
# res$data %>%
#   filter(grepl("host", occurrenceRemarks))
# #filter(grepl("host", occurrenceRemarks) | grepl("host", associatedTaxa))
#
# x <- name_backbone(name = "Conopholis americana")
# occ_count(taxonKey = x$usageKey)
#
# x <- name_backbone(name = "Viscum album")
# occ_count(taxonKey = x$usageKey)
# (res <- occ_search(taxonKey = x$usageKey, limit = 500))
# res$data %>% filter(!is.na(occurrenceRemarks)) %>% select(occurrenceRemarks)
#
# res <- occ_download(paste0('taxonKey = ', x$usageKey))
# occ_download_meta(res)
# df <- occ_download_get(res, overwrite = TRUE) %>% occ_download_import()
# tbl_df(df) %>% select(starts_with("associated")) %>% data.frame
