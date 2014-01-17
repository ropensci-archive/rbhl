#' Return a list of names that appear on a page.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param page page number to get
#' @examples \dontrun{
#' bhl_getpagenames('1328690')
#' bhl_getpagenames('1328690', 'xml', 'raw')
#' bhl_getpagenames('1328690', 'xml', 'parsed')
#' }
#' @export
bhl_getpagenames <- function(page = NULL, format = 'json', output='list',
  key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetPageNames", apikey=key, format=format, pageid=page))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}