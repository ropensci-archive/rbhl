#' Return metadata about a title. You may choose to include a list of 
#'    the items (books) associated  with the title.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param titleid the identifier of an individual title (numeric)
#' @param items (logical) TRUE of FALSE (default) to inclue items
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_gettitlemetadata(1726, TRUE)
#' bhl_gettitlemetadata(1726, output='raw')
#' bhl_gettitlemetadata(1726, format='xml', output='raw')
#' bhl_gettitlemetadata(1726, format='xml', output='parsed')
#' }
#' @export
bhl_gettitlemetadata <- function(titleid = NA, items = FALSE, format = "json",
  output='list', key = NULL, callopts=list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleMetadata", apikey = key, format = format,
                       titleid=titleid, items=items))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}