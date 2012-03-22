#'GetAuthorTitles.R
#'
#'<longer description>
#'@param  key API Key
#'@param  creatorid: BHL identifier for a particular author (numeric)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetAuthorTitles(1970)
#'}
GetAuthorTitles <- function(creatorid = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetAuthorTitles", apikey = key, format = format)
    if (!is.na(creatorid)) 
        args$creatorid <- creatorid
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
