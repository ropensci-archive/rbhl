#' Search for a particular name. 
#' 
#' Names both with and without NameBank identifiers are returned.
#'
#' @param name species name (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_namesearch('poa annua')
#' bhl_namesearch(name='helianthus annuus')
#' }
#' @export
bhl_namesearch <- function(name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  message("This method was available in V1 of the API, but appears down now, will update again if becomes avaialable again.")
#   args <- list(op = "NameSearch", apikey = key, format = format)
#   if (!is.na(name)) 
#     args$name <- name
#   message(query2message(url, args))
#   tt <- getForm(url, .params = args, ..., curl = curl)
#   outprod <- fromJSON(I(tt))$Result
#   getit <- function(x) {
#     x[sapply(x, is.null)] <- "none"
#     data.frame(x)
#   }
#   ldply(outprod, getit)
}