#'GetItemPages.R
#'
#'<longer description>
#'@param key API Key
#'@param  itemid: the item id (character)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetItemPages('16800')
#'}
GetItemPages <- function(itemid = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetItemPages", apikey = key, format = format)
    if (!is.na(itemid)) 
        args$itemid <- itemid
    tt <- getForm(url, .params = args, ..., curl = curl)
    outprod <- fromJSON(I(tt))
    return(outprod)
} 
