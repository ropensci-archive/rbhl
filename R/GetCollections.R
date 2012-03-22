#' GetCollections.R
#'
#'<longer description>
#'@param key
#'@param   pretty: print pretty, as data.frame (TRUE/FALSE)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetCollections()
#' GetCollections(pretty = T)
#'}
GetCollections <- function(pretty = FALSE, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetCollections", apikey = key, format = format)
    tt <- getForm(url, .params = args, ..., curl = curl)
    temp <- fromJSON(I(tt))
    if (!pretty == TRUE) {
        temp
    } else {
        ldply(nn$Result, function(x) as.data.frame(x))
    }
} 
