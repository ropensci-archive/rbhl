#' Return a list of titles associated with a given BHL author identifier.
#'
#' Unless the identifier  for a particular BHL author record is known in
#'    advance, this method should be used in combination	with the AuthorSearch
#'    method.
#'
#' @import httr
#' @importFrom plyr compact
#' @template all
#' @param creatorid BHL identifier for a particular author (numeric)
#' @export
#' @examples \dontrun{
#' bhl_getauthortitles(1970)
#' bhl_getauthortitles(1970, output='raw')
#' bhl_getauthortitles(1970, output='raw', format='xml')
#' }
bhl_getauthortitles <- function(creatorid = NA, format = "json", output='list',
  key = NULL, callopts=list())
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetAuthorTitles", apikey = check_key(key), format = format,
                       creatorid=creatorid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
