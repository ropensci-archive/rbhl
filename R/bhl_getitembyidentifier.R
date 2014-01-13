#' Find and return metadata about an item or items that match a specific identifier.  
#' 
#' If you know the Internet Archive identifier for an item, use this method to 
#'    look up the equivalent item in BHL.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param type the type of identifier (barcode or ia) (character)
#' @param value the identifier value (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi')
#' bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml')
#' bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml', output='raw')
#' bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml', output='parsed')
#' }
#' @export
bhl_getitembyidentifier <- function(type = NULL, value = NULL, format = 'json', 
  output = "list", key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetItemByIdentifier", apikey = key, type=type, 
                       value=value, format=format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
} 