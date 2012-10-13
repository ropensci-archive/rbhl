#' Return a list of a title's items (books).
#'
#' @import RCurl RJSONIO
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' gettitleitems(1726)
#' }
#' @export
gettitleitems <- function(titleid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetTitleItems", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}