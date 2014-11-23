#' Return a list of an item's pages.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param itemid the item id (character)
#' @param ocr return ocr text of the page (TRUE/FALSE)
#' @examples \dontrun{
#' bhl_getitempages('16800')
#' bhl_getitempages('16800', 'xml', 'raw')
#' bhl_getitempages('16800', 'xml', 'parsed')
#'
#' # Return ocr text
#' bhl_getitempages('16800', TRUE)
#' }
#' @export
bhl_getitempages <- function(itemid, ocr=FALSE, format = "json", output='list',
  key = NULL, callopts = list())
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetItemPages", apikey = check_key(key), format = format,
                       itemid=itemid, ocr=if(ocr) 't' else NULL))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
