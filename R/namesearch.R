#' Search for a particular name. 
#' 
#' Names both with and without NameBank identifiers are returned.
#'
#' @import RCurl RJSONIO plyr
#' @param name species name (character)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' namesearch('poa annua')
#' namesearch(name='helianthus annuus')
#' }
#' @export
namesearch <- function(name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "NameSearch", apikey = key, format = format)
  if (!is.na(name)) 
    args$name <- name
  message(query2message(url, args))
  tt <- getForm(url, .params = args, ..., curl = curl)
  outprod <- fromJSON(I(tt))$Result
  getit <- function(x) {
    x[sapply(x, is.null)] <- "none"
    data.frame(x)
  }
  ldply(outprod, getit)
}