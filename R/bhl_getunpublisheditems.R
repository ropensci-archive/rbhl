#' Return a list of the identifiers of all unpublished items.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @examples \dontrun{
#' bhl_getunpublisheditems()
#' bhl_getunpublisheditems(output='raw')
#' bhl_getunpublisheditems(format='xml', output='raw')
#' bhl_getunpublisheditems(format='xml', output='parsed')
#' }
#' @export
bhl_getunpublisheditems <- function(format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetUnpublishedItems", apikey = check_key(key), format = format))
  out <- GET(url, query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
