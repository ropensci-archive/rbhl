#' Return a list of authors that match (fully or partially) the specified
#'    search string.
#'
#' The namessearched are those contained in MARC 100a, 110a, 111a, 700a,
#'    710a, and 711a library records.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param name full or partial name of the author for which to search
#'     (last name listed first, i.e. 'Darwin, Charles') (character)
#' @export
#' @examples \dontrun{
#' bhl_authorsearch(name='dimmock')
#' bhl_authorsearch(name='Jones')
#' }
bhl_authorsearch <- function(name = NULL, format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op="AuthorSearch", name=name, apikey=check_key(key), format=format))
  out <- GET(url, query=args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
