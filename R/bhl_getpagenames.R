#' Return a list of names that appear on a page.
#'
#' @export
#' @param page page number to get
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getpagenames('1328690')
#' bhl_getpagenames('1328690', 'json')
#' bhl_getpagenames('1328690', 'list')
#' }

bhl_getpagenames <- function(page = NULL, as = 'table', key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- compact(list(op = "GetPageNames", apikey=check_key(key), format=format, pageid=page))
  bhl_GET(as, args, ...)
}
