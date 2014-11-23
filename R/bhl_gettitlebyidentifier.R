#' Find and return metadata about a title or titles that match a specific identifier.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param type the type of identifier (oclc, issn, isbn, lccn, ddc, nal, nlm, coden) character
#' @param value the identifier value (numeric)
#' @examples \dontrun{
#' bhl_gettitlebyidentifier('oclc', 2992225)
#' bhl_gettitlebyidentifier('oclc', 2992225, output='raw')
#' bhl_gettitlebyidentifier('oclc', 2992225, format='xml', output='raw')
#' bhl_gettitlebyidentifier('oclc', 2992225, format='xml', output='parsed')
#' }
#' @export
bhl_gettitlebyidentifier <- function(type=NULL, value=NULL, format = "json",
    output='list', key = NULL, ...)
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleByIdentifier", apikey = check_key(key), format = format,
                       type=type, value=value))
  out <- GET(url, query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
