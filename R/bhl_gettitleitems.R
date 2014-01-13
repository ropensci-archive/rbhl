#' Return a list of a title's items (books).
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_gettitleitems(1726)
#' bhl_gettitleitems(1726, output='raw')
#' bhl_gettitleitems(1726, format='xml', output='raw')
#' bhl_gettitleitems(1726, format='xml', output='parsed')
#' }
#' @export
bhl_gettitleitems <- function(titleid = NULL, format = "json", output='list',
  key = NULL, callopts=list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleItems", apikey = key, format = format, titleid=titleid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}