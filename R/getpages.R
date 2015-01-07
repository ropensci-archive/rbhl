#' Get many OCR-generated pages given a single item id
#'
#' @export
#' @param itemid the item id (character)
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' books <- bhl_booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825,
#'    collectionid=4, language='eng')
#' bhl_getpages(itemid=16800)
#' }

getpages <- function(itemid = NULL, key = NULL, ...){
  res <- bhl_getitempages(itemid, ...)
  out <- lapply(res$PageID, function(x){
    tmp <- bhl_getpageocrtext(page = x)
    if(grepl("OCR text unavailable for this page", tmp))
      NULL
    else
      tmp
  })
  setNames(out, res$PageID)
}
