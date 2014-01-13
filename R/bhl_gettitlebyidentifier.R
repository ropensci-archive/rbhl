#' Find and return metadata about a title or titles that match a specific identifier.
#' 
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param type the type of identifier (oclc, issn, isbn, lccn, ddc, nal, nlm, coden) character
#' @param value the identifier value (numeric)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_gettitlebyidentifier('oclc', 2992225)
#' bhl_gettitlebyidentifier('oclc', 2992225, output='raw')
#' bhl_gettitlebyidentifier('oclc', 2992225, format='xml', output='raw')
#' bhl_gettitlebyidentifier('oclc', 2992225, format='xml', output='parsed')
#' }
#' @export
bhl_gettitlebyidentifier <- function(type=NULL, value=NULL, format = "json",
    output='list', key = NULL, callopts=list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleByIdentifier", apikey = key, format = format, 
                       type=type, value=value))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}