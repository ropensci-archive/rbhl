#' Perform a simple title search. 
#' 
#' The full title (as specified in MARC 245a and MARC 245b library records) 
#'    is searched for the specified string. Basic metadata for all full and 
#'    partial matches is returned.
#'
#' @import RCurl RJSONIO
#' @param  title full or partial title for which to search (character)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' titlesearchsimple('nematocerous')
#' titlesearchsimple('husbandry')
#' }
#' @export
titlesearchsimple <- function(title = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "TitleSearchSimple", apikey = key, format = format)
    if (!is.na(title)) 
        args$title <- title
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}