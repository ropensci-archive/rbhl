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
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetPartMetadata", apikey = check_key(key), format = format,
                       partid=partid))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
