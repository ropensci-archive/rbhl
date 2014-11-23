#' Return a list of the identifiers of all unpublished titles.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @examples \dontrun{
#' bhl_getunpublishedtitles()
#' bhl_getunpublishedtitles(output='raw')
#' bhl_getunpublishedtitles(format='xml', output='raw')
#' bhl_getunpublishedtitles(format='xml', output='parsed')
#' }
#' @export
bhl_getunpublishedtitles <- function(format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetUnpublishedTitles", apikey = check_key(key), format = format))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
