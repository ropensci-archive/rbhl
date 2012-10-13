#' Return a list of the identifiers of all unpublished titles.
#'
#' @import RCurl RJSONIO
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getunpublishedtitles()
#' }
#' @export
getunpublishedtitles <- function(format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "GetUnpublishedTitles", apikey = key, format = format)
  message(query2message(url, args))
  tt <- getForm(url, .params = args, ..., curl = curl)
  fromJSON(I(tt))
}