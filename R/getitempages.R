#' Return a list of an item's pages.
#'
#' @import RCurl RJSONIO
#' @param itemid the item id (character)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getitempages('16800')
#' }
#' @export
getitempages <- function(itemid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetItemPages", apikey = key, format = format)
    if (!is.na(itemid)) 
        args$itemid <- itemid
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    outprod <- fromJSON(I(tt))
    outprod
} 
