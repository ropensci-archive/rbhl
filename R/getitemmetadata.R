#' Return metadata about an item. 
#' 
#' You may choose to include a list of the item's pages.
#'
#' @import RCurl RJSONIO XML
#' @param itemid item id (character)
#' @param pages return the items pages (TRUE/FALSE)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getitemmetadata('16800', 'json', TRUE)
#' }
#' @export
getitemmetadata <- function(itemid = NA, format = NA, 
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
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    outprod
}