#' Return a list of a title's items (books).
#'
#' @export
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_gettitleitems(1726)
#' bhl_gettitleitems(1726, as='xml')
#' bhl_gettitleitems(1726, as='list')
#' }

bhl_gettitleitems <- function(titleid, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetTitleItems", apikey = check_key(key), format = format, titleid=titleid))
  bhl_GET(as, args, ...)
}
