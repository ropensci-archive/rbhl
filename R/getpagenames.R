#' getpagenames
#'
#' @import RCurl RJSONIO XML
#' @param page page number to get
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' getpagenames('1328690', 'json')
#' }
getpagenames <- function(page = NA, format = NA, 
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetPageNames", apikey = key)
    if (!is.na(page)) 
        args$pageid <- page
    if (!is.na(format)) 
        args$format <- format
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    outprod
}