#' Find and return metadata about an item or items that match a specific identifier.  
#' 
#' If you know the Internet Archive identifier for an item, use this method to 
#'    look up the equivalent item in BHL.
#'
#' @import RCurl RJSONIO XML
#' @param type the type of identifier (barcode or ia) (character)
#' @param value the identifier value (character)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getitembyidentifier('ia', 'animalkingdomarr03cuvi', 'json')
#' }
#' @export
getitembyidentifier <- function(type = NA, value = NA, format = NA, 
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetItemByIdentifier", apikey = key)
    if (!is.na(type)) 
        args$type <- type
    if (!is.na(value)) 
        args$value <- value
    if (!is.na(format)) 
        args$format <- format
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    outprod
} 