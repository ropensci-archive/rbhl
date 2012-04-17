#' getlanguages
#'
#' @import RCurl RJSONIO
#' @param pretty print pretty, as data.frame (TRUE/FALSE)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' getlanguages()
#' getlanguages(pretty = T)
#' }
getlanguages <- function(pretty = FALSE, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle())
{
    args <- list(op = "GetLanguages", apikey = key, format = format)
    tt <- getForm(url, .params = args, ..., curl = curl)
    temp <- fromJSON(I(tt))
    if (!pretty == TRUE) {
        temp
    } else {
        ldply(temp$Result, identity)
    }
}