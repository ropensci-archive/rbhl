#' Return a list of the identifiers of all unpublished items.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param type The type of identifier (doi, oclc, issn, isbn, lccn, ddc, nal, nlm, coden)
#' @param value The identifier value
#' @examples \dontrun{
#' bhl_getpartbyidentifier('doi', '10.4039/Ent38406-12')
#' bhl_getpartbyidentifier('doi', '10.4039/Ent38406-12', output='raw')
#' bhl_getpartbyidentifier('doi', '10.4039/Ent38406-12', format='xml', output='raw')
#' bhl_getpartbyidentifier('doi', '10.4039/Ent38406-12', format='xml', output='parsed')
#' }
#' @export
bhl_getpartbyidentifier <- function(type=NULL, value=NULL, format = "json", output='list',
  key = NULL, callopts=list())
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetPartByIdentifier", apikey = check_key(key), format = format,
                       type=type, value=value))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
