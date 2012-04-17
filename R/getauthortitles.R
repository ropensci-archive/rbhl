#' getauthortitles
#'
#' @import RCurl RJSONIO
#' @param creatorid BHL identifier for a particular author (numeric)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' getauthortitles(1970)
#' }
getauthortitles <- function(creatorid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "GetAuthorTitles", apikey = key, format = format)
  if (!is.na(creatorid)) 
      args$creatorid <- creatorid
  tt <- getForm(url, .params = args, ..., curl = curl)
  fromJSON(I(tt))
}