#' Get a list of collections which are used to group titles and items. A single 
#'    collection may contain either titles or items, but not both.
#'
#' @import RCurl RJSONIO plyr
#' @param pretty Print pretty as a data.frame (TRUE/FALSE).
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getcollections()
#' getcollections(pretty = T)
#' }
#' @export
getcollections <- function(pretty = FALSE, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetCollections", apikey = key, format = format)
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    temp <- fromJSON(I(tt))
    if (!pretty == TRUE) {
        temp
    } else {
        ldply(temp$Result, function(x) as.data.frame(x))
    }
}