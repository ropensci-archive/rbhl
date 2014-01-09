#' Return metadata about an item. 
#' 
#' You may choose to include a list of the item's pages.
#'
#' @import httr XML RJSONIO
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param itemid item id (character)
#' @param pages return the items pages (TRUE/FALSE)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getitemmetadata('16800', TRUE)
#' bhl_getitemmetadata('16800', TRUE, 'xml', 'parsed')
#' bhl_getitemmetadata('16800', TRUE, 'json', 'raw')
#' bhl_getitemmetadata('16800', TRUE, 'xml', 'raw')
#' }
#' @export
bhl_getitemmetadata <- function(itemid = NULL, pages = TRUE, format='json',
  output = 'list', key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts = list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op="GetItemMetadata", apikey=key, pages=pages, itemid=itemid,
                       format=format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}