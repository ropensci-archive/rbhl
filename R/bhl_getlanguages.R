#' Get a list of languages in which materials in BHL have been written.
#'
#' @export
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getlanguages()
#' bhl_getlanguages('json')
#' bhl_getlanguages('xml')
#' bhl_getlanguages('list')
#' }
bhl_getlanguages <- function(as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- compact(list(op = "GetLanguages", apikey = check_key(key), format = format))
  bhl_GET(as, args, ...)
}
