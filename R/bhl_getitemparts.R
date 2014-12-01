#' Return a list of an item's parts.
#'
#' @export
#'
#' @param itemid the item id (character)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getitemparts(35600)
#' bhl_getitemparts(35600, 'json')
#' bhl_getitemparts(35600, 'xml')
#' }

bhl_getitemparts <- function(itemid, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetItemParts", apikey = check_key(key), format = format,
                       itemid=itemid))
  bhl_GET(as, args, ...)
}
