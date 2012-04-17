#' gettitlebyidentifier
#' 
#' @import RCurl RJSONIO
#' @param type the type of identifier (oclc, issn, isbn, lccn, ddc, nal, nlm, coden) character
#' @param value the identifier value (numeric)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' gettitlebyidentifier('oclc', 2992225)
#' }
gettitlebyidentifier <- function(type = NA, value, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetTitleByIdentifier", apikey = key, format = format)
    if (!is.na(type)) 
        args$type <- type
    if (!is.na(value)) 
        args$value <- value
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}