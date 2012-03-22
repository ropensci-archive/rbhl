#'GetTitleItems.R
#'
#'<longer description>
#'@param key API Key
#'@param titleid: the identifier of an individual title (numeric)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetTitleItems(1726)
#'}
GetTitleItems <- function(titleid = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetTitleItems", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
