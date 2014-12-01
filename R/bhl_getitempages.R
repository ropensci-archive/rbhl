#' Return a list of an item's pages.
#'
#' @export
#'
#' @param itemid the item id (character)
#' @param ocr return ocr text of the page (TRUE/FALSE)
#' @inheritParams bhl_getcollections
#'
#' @examples \dontrun{
#' bhl_getitempages('16800')
#' bhl_getitempages('16800', as='json')
#' bhl_getitempages('16800', as='xml')
#'
#' # Return ocr text
#' bhl_getitempages('16800', TRUE)
#' }

bhl_getitempages <- function(itemid, ocr=FALSE, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetItemPages", apikey = check_key(key), format = format,
                       itemid=itemid, ocr=if(ocr) 't' else NULL))
  bhl_GET(as, args, ...)
}
