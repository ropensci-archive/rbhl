#' Return a list of scientific names associated with a part.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param partid The identifier of an individual part (article, chapter, etc) (character)
#' @examples \dontrun{
#' bhl_getpartnames(7443)
#' }
#' @export
bhl_getpartnames <- function(partid, format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetPartNames", apikey = check_key(key), format = format,
                       partid=partid))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
