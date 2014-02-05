#' Search for a particular name.
#' 
#' Names both with and without NameBank identifiers are returned.
#'
#' @param name species name (character)
#' @template all
#' @export
#' @examples \dontrun{
#' bhl_namesearch('poa annua')
#' bhl_namesearch(name='helianthus annuus')
#' bhl_namesearch(name='helianthus annuus', format='xml', output='raw')
#' bhl_namesearch(name='helianthus annuus', format='json', output='raw')
#' }

bhl_namesearch <- function(name = NULL, format = "json", output = 'list',
  key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "NameSearch", name = name, apikey = key, format = format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}