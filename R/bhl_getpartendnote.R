#' Return a citation for a part, using the EndNote format.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param partid The identifier of an individual part (article, chapter, etc) (numeric)
#' @examples \dontrun{
#' bhl_getpartendnote(1000)
#' bhl_getpartendnote(1000, output='raw')
#' bhl_getpartendnote(1000, format='xml', output='raw')
#' bhl_getpartendnote(1000, format='xml', output='parsed')
#' }
#' @export
bhl_getpartendnote <- function(partid, format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetPartEndNote", apikey = check_key(key), format = format, partid=partid))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
