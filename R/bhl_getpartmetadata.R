#' Return a list of an item's pages.
#'
#' @export
#' @param partid The identifier of an individual part (article, chapter, etc) (numeric)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getpartmetadata(10409)
#' bhl_getpartmetadata(10409, 'xml')
#' bhl_getpartmetadata(10409, 'json')
#' }

bhl_getpartmetadata <- function(partid, as = "table", key = NULL, ...)
{
  args <- bhlc(list(op = "GetPartMetadata", apikey = check_key(key), format = as_f(as),
                       partid=partid))
  bhl_GET(as, args, ...)
}
