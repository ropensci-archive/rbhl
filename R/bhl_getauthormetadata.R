#' Get metadata about an author
#'
#' @export
#' @param id (numeric) the identifier of an individual author
#' @param id_type (character) the type of identifier (bhl, biostor, viaf).
#' Default: "bhl"
#' @param pubs (logical) `TRUE` to return the subject's publications.
#' Default: `FALSE`
#' @inheritParams bhl_getcollections
#' @details You may choose to include a list of the author's publications.
#' The BHLType element identifies the type of each publication (Title or Part).
#' @examples \dontrun{
#' bhl_getauthormetadata(87509)
#' bhl_getauthormetadata(87509, pubs = TRUE, verbose = TRUE)
#' bhl_getauthormetadata(87509, as = "json")
#' }
bhl_getauthormetadata <- function(id, id_type = "bhl", pubs = FALSE,
  as = "table", key = NULL, ...) {

  args <- bhlc(list(op = "GetAuthorMetadata", id= id, idtype = id_type,
    pubs = if (pubs) "t" else NULL, apikey = check_key(key),
    format = as_f(as)))
  bhl_GET(as, args, ...)
}
