#' Return a list of the identifiers of all unpublished parts (articles, chapters, etc).
#'
#' @export
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getunpublishedparts()
#' bhl_getunpublishedparts('json')
#' bhl_getunpublishedparts('xml')
#' }

bhl_getunpublishedparts <- function(as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- compact(list(op = "GetUnpublishedParts", apikey = check_key(key), format = format))
  bhl_GET(as, args, ...)
}
