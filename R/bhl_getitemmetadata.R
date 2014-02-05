#' Return metadata about an item. 
#' 
#' You may choose to include a list of the item's pages.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param itemid item id (character)
#' @param pages return the items pages (logical)
#' @param ocr return ocr text of the page (logical)
#' @template all
#' @export
#' @examples \dontrun{
#' bhl_getitemmetadata('16800', TRUE)
#' bhl_getitemmetadata('16800', TRUE, 'xml', 'parsed')
#' bhl_getitemmetadata('16800', TRUE, 'json', 'raw')
#' bhl_getitemmetadata('16800', TRUE, 'xml', 'raw')
#' }

bhl_getitemmetadata <- function(itemid = NULL, pages = TRUE, ocr = FALSE, 
  format='json', output = 'list', key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op="GetItemMetadata", apikey=key, pages=pages, 
                       itemid=itemid, ocr=ocr, format=format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}