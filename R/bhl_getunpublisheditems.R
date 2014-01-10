#' Return a list of the identifiers of all unpublished items.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getunpublisheditems()
#' bhl_getunpublisheditems(output='raw')
#' bhl_getunpublisheditems(format='xml', output='raw')
#' bhl_getunpublisheditems(format='xml', output='parsed')
#' }
#' @export
bhl_getunpublisheditems <- function(format = "json", output='list', 
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts=list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetUnpublishedItems", apikey = key, format = format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}