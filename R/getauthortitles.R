#' Return a list of titles associated with a given BHL author identifier. 
#' 
#' Unless the identifier  for a particular BHL author record is known in 
#'    advance, this method should be used in combination	with the AuthorSearch 
#'    method.
#'
#' @import RCurl RJSONIO
#' @param creatorid BHL identifier for a particular author (numeric)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getauthortitles(1970)
#' }
#' @export
getauthortitles <- function(creatorid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "GetAuthorTitles", apikey = key, format = format)
  if (!is.na(creatorid)) 
      args$creatorid <- creatorid
  message(query2message(url, args))
  tt <- getForm(url, .params = args, ..., curl = curl)
  fromJSON(I(tt))
}