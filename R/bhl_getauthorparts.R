#' Return a list of parts (articles, chapters, etc) associated with a given BHL
#' author identifier. Unless the identifier  for a particular BHL author record
#' is known in advance, this method should be used in combination	with the
#' AuthorSearch method.
#'
#' Note: haven't seen examples for this function that work yet...
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param creatorid BHL identifier for a particular author (numeric)
#' @examples \dontrun{
#' bhl_getauthorparts(147)
#' bhl_getauthorparts(39120, output='raw')
#' bhl_getauthorparts(39120, format='xml', output='raw')
#' bhl_getauthorparts(39120, format='xml', output='parsed')
#' }
#' @export
bhl_getauthorparts <- function(creatorid, format = "json", output='list',
  key = NULL, callopts=list())
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetAuthorParts", apikey = check_key(key), format = format,
                       creatorid=creatorid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
