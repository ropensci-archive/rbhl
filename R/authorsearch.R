#' authorsearch
#'
#' @import RCurl RJSONIO
#' @param name full or partial name of the author for which to search
#'     (last name listed first, i.e. 'Darwin, Charles') (character)
#' @param format either XML ("xml") or JSON ("json") format
#' @param url the BHL API url for the function (should be left to default)
#' @param key your BHL API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @export
#' @examples \dontrun{
#' authorsearch('dimmock')
#' }
authorsearch <- function(name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "AuthorSearch", apikey = key, format = format)
  if (!is.na(name)) 
    args$name <- name
  tt <- getForm(url, .params = args, ..., curl = curl)
  fromJSON(I(tt))
}