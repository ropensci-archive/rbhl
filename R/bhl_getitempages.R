#' Return a list of an item's pages.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param itemid the item id (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getitempages('16800')
#' bhl_getitempages('16800', 'xml', 'raw')
#' bhl_getitempages('16800', 'xml', 'parsed')
#' }
#' @export
bhl_getitempages <- function(itemid = NA, format = "json", output='list',
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetItemPages", apikey = key, format = format, 
                       itemid=itemid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}