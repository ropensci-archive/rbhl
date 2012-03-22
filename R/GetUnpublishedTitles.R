#'GetUnpublishedTitles.R
#'
#'<longer description>
#'@param key API Key
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' v
#'}
GetUnpublishedTitles <- function(url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetUnpublishedTitles", apikey = key, format = format)
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
