#' Get many OCR-generated pages given a single item id
#'
#' @export
#' @param itemid the item id (character). Required
#' @param key Your BHL API key, either enter, or loads from your
#' `.Renviron` as `BHL_KEY` or from `.Rprofile` as
#' `bhl_key`
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @examples \dontrun{
#' # books <- bhl_booksearch(title='Selborne', lname='White', volume=2,
#' #   edition='new', year=1825, collectionid=4, language='eng')
#' # getpages(itemid = 16800)
#' }

getpages <- function(itemid, key = NULL, ...) {
  res <- bhl_getitemmetadata(itemid, ...)
  out <- lapply(res$PageID, function(x){
    tmp <- bhl_getpageocrtext(page = x)
    if (grepl("OCR text unavailable for this page", tmp))
      NULL
    else
      tmp
  })
  stats::setNames(out, res$PageID)
}
