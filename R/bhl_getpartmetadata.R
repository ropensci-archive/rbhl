#' Return a list of an item's pages.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param partid The identifier of an individual part (article, chapter, etc) (numeric)
#' @examples \dontrun{
#' bhl_getpartmetadata(10409)
#' bhl_getpartmetadata(10409, 'xml', 'raw')
#' bhl_getpartmetadata(10409, 'xml', 'parsed')
#' }
#' @export
bhl_getpartmetadata <- function(partid, format = "json", output='list',
  key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetPartMetadata", apikey = key, format = format, 
                       partid=partid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}