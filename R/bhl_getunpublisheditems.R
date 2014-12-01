#' Return a list of the identifiers of all unpublished items.
#'
#' @export
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getunpublisheditems()
#' bhl_getunpublisheditems('xml')
#' bhl_getunpublisheditems('json')
#' }

bhl_getunpublisheditems <- function(as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- compact(list(op = "GetUnpublishedItems", apikey = check_key(key), format = format))
  bhl_GET(as, args, ...)
}
