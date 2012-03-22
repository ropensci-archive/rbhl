#'GetItemMetadata.R
#'
#'<longer description>
#'@param key API Key
#'@param  itemid: item id (character)
#'@param  pages: return the items pages (TRUE/FALSE)
#'@param  format: json or xml (character)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetItemMetadata('16800', 'json', TRUE)
#'}
GetItemMetadata <- function(itemid = NA, format = NA, 
    pages = TRUE, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) {
    args <- list(op = "GetItemMetadata", apikey = key)
    if (pages == "TRUE") {
        args$pages <- "t"
    } else if (pages == "FALSE") {
        args$pages <- NULL
    }
    if (!is.na(itemid)) 
        args$itemid <- itemid
    if (!is.na(format)) 
        args$format <- format
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    return(outprod)
} 
