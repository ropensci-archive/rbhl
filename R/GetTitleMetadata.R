#' GetTitleMetadata.R
#'
#'<longer description>
#'@param key API key
#'@param  titleid: the identifier of an individual title (numeric)
#'@param items: logical.
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetTitleMetadata(1726, TRUE)
#'}
GetTitleMetadata <- function(titleid = NA, items = FALSE, 
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetTitleMetadata", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    if (items == "TRUE") {
        args$items <- "t"
    } else if (items == "FALSE") {
        args$items <- NULL
    }
    tt <- getForm(url, .params = args, ..., curl = curl)
    outprod <- fromJSON(I(tt))
    return(outprod)
} 
