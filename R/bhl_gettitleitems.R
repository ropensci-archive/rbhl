#' Return a list of a title's items (books).
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param titleid the identifier of an individual title (numeric)
#' @examples \dontrun{
#' bhl_gettitleitems(1726)
#' bhl_gettitleitems(1726, output='raw')
#' bhl_gettitleitems(1726, format='xml', output='raw')
#' bhl_gettitleitems(1726, format='xml', output='parsed')
#' }
#' @export
bhl_gettitleitems <- function(titleid = NULL, format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetTitleItems", apikey = check_key(key), format = format, titleid=titleid))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
