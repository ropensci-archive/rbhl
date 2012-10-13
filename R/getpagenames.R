#' Return a list of names that appear on a page.
#'
#' @import RCurl RJSONIO XML
#' @param page page number to get
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getpagenames('1328690', 'json')
#' }
#' @export
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
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    outprod
}