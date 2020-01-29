#' Get many OCR-generated pages given a single item id
#'
#' @export
#' @param itemid the item id (character). Required
#' @param key Your BHL API key, either enter, or loads from your
#' `.Renviron` as `BHL_KEY` or from `.Rprofile` as
#' `bhl_key`
#' @param ... Curl options passed on to [crul::HttpClient()]
#' @examples \dontrun{
#' x <- bhl_publicationsearch('Selborne', year=1825, collection=4,
#'   language='eng')
#' bhl_pages(itemid = x$ItemID[1])
#' }
bhl_pages <- function(itemid, key = NULL, ...) {
  res <- bhl_getitemmetadata(itemid, ...)
  out <- lapply(res$Pages[[1]]$PageID, function(x){
    tmp <- tryCatch(bhl_getpagemetadata(page = x, ocr = TRUE),
      error = function(e) e)
    if (inherits(tmp, "error")) tibble::tibble() else tmp
  })
  stats::setNames(out, res$Pages[[1]]$PageID)
}
