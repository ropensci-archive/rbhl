#' getunpublishedtitles
#'
#' @import RCurl RJSONIO
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' getunpublishedtitles()
#' }
getunpublishedtitles <- function(format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "GetUnpublishedTitles", apikey = key, format = format)
  tt <- getForm(url, .params = args, ..., curl = curl)
  fromJSON(I(tt))
}