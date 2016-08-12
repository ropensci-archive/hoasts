library(dplyr)

(key <- name_suggest(q='Varroa destructor', rank='species')$key[1])
res <- occ_search(taxonKey=key, limit=500, search = "host")
res
res$data[, apply(res$data, 2, function(x) length(grep("host", x, ignore.case = TRUE, value = TRUE))) != 0] %>%
  filter(grepl("host", occurrenceRemarks))

res$data %>%
  filter(grepl("host", occurrenceRemarks))
  #filter(grepl("host", occurrenceRemarks) | grepl("host", associatedTaxa))

x <- name_backbone(name = "Conopholis americana")
occ_count(taxonKey = x$usageKey)

res <- occ_download(paste0('taxonKey = ', x$usageKey))
occ_download_meta(res)
df <- occ_download_get(res, overwrite = TRUE) %>% occ_download_import()
tbl_df(df) %>% select(starts_with("associated")) %>% data.frame


#####
ha_search <- function(q, from = "gbif", ...) {
  key <- name_suggest(q = q, rank = 'species')$key[1]
  res <- occ_data(taxonKey = key, limit = 2000)
  #res <- occ_data(search = "host", limit = 1500)

  # select only columns that have 'host' in any cell
  df <- res$data[, apply(res$data, 2, function(x) length(grep("host", x, ignore.case = TRUE, value = TRUE))) != 0]

  # select only columns of interest for host data
  df <- filter(df, grepl("host", occurrenceRemarks) | grepl("host", associatedTaxa))
  #filter(grepl("host", occurrenceRemarks))

  df
}

