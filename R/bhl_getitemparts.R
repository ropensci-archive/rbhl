#' Return a list of an item's parts.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param itemid the item id (character)
#' @examples \dontrun{
#' bhl_getitemparts(35600)
#' bhl_getitemparts(35600, 'xml', 'raw')
#' bhl_getitemparts(35600, 'xml', 'parsed')
#' }
#' @export
bhl_getitemparts <- function(itemid, format = "json", output='list',
  key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetItemParts", apikey = key, format = format, 
                       itemid=itemid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}