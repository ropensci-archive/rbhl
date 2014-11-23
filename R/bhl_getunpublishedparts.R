#' Return a list of the identifiers of all unpublished parts (articles, chapters, etc).
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @examples \dontrun{
#' bhl_getunpublishedparts()
#' bhl_getunpublishedparts(output='raw')
#' bhl_getunpublishedparts(format='xml', output='raw')
#' bhl_getunpublishedparts(format='xml', output='parsed')
#' }
#' @export
bhl_getunpublishedparts <- function(format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetUnpublishedParts", apikey = check_key(key), format = format))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
