#' Return a list of the identifiers of all unpublished titles.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getunpublishedtitles()
#' bhl_getunpublishedtitles(output='raw')
#' bhl_getunpublishedtitles(format='xml', output='raw')
#' bhl_getunpublishedtitles(format='xml', output='parsed')
#' }
#' @export
bhl_getunpublishedtitles <- function(format = "json", output='list', 
  key = NULL, callopts=list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetUnpublishedTitles", apikey = key, format = format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}