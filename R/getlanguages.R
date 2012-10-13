#' Get a list of languages in which materials in BHL have been written.
#'
#' @import RCurl RJSONIO
#' @param pretty print pretty, as data.frame (TRUE/FALSE)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getlanguages()
#' getlanguages(pretty = T)
#' }
#' @export
getlanguages <- function(pretty = FALSE, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle())
{
    args <- list(op = "GetLanguages", apikey = key, format = format)
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    temp <- fromJSON(I(tt))
    if (!pretty == TRUE) {
        temp
    } else {
        ldply(temp$Result, identity)
    }
}