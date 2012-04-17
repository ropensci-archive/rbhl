#' titlesearchsimple
#'
#' @import RCurl RJSONIO
#' @param 'BioHerLibKey' API Key
#' @param  URL Internal use
#' @param  title full or partial title for which to search (character)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' titlesearchsimple('nematocerous')
#' titlesearchsimple('husbandry')
#' }
titlesearchsimple <- function(title = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "TitleSearchSimple", apikey = key, format = format)
    if (!is.na(title)) 
        args$title <- title
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}