#'NameCount.R
#'
#'<longer description>
#'@param key API key
#'@param  startdate
#'@param  enddate
#'@param  url Internal use only
#'@param  format JSON
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'
#'}
NameCount <- function(startdate = NA, enddate = NA, 
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "NameCount", apikey = key, format = format)
    if (!is.na(startdate)) 
        args$startdate <- startdate
    if (!is.na(enddate)) 
        args$enddate <- enddate
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
