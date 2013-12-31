#' Return a list of titles associated with a subject.
#'
#' @import RCurl RJSONIO
#' @param subject the full or partial subject for which to search (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getsubjecttitles('diptera')
#' }
#' @export
bhl_getsubjecttitles <- function(subject = NA, format = "json", 
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetSubjectTitles", apikey = key, format = format)
    if (!is.na(subject)) 
        args$subject <- subject
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}