#' Return metadata about an item. 
#' 
#' You may choose to include a list of the item's pages.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param itemid item id (character)
#' @param pages return the items pages (TRUE/FALSE)
#' @param ocr (logical) TRUE to return the ocr for the item's pages. Setting this
#' to TRUE apparently doesn't return any actual ocr text, but leaving parameter 
#' here for now.
#' @param parts (logical) TRUE to return the item's parts. Setting this
#' to TRUE apparently doesn't return any parts text, but leaving parameter 
#' here for now.
#' @examples \dontrun{
#' bhl_getitemmetadata('16800', TRUE)
#' bhl_getitemmetadata('16800', TRUE, 'xml', 'parsed')
#' bhl_getitemmetadata('16800', TRUE, 'json', 'raw')
#' bhl_getitemmetadata('16800', TRUE, 'xml', 'raw')
#' 
#' 
#' bhl_getitemmetadata(20419, pages=FALSE, parts=TRUE)
#' }
#' @export
bhl_getitemmetadata <- function(itemid = NULL, pages = TRUE, ocr=FALSE, parts=FALSE,
  format='json', output = 'list', key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op="GetItemMetadata", apikey=key, pages=pages, itemid=itemid,
                       format=format, ocr=if(ocr) 't' else NULL, 
                       parts=if(parts) 't' else NULL))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}