#' Get basic title, item, and page metadata for each page on which the specified name appears.
#'
#' @param namebankid (not used if 'name' specified) NameBank identifier for a name (numeric)
#' @param name (not used if 'namebankid' specified) a complete name string (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_namegetdetail(namebankid = 3501464)
#' bhl_namegetdetail(name = 'poa annua supina')
#' }
#' @export
bhl_namegetdetail <- function(namebankid = NA, name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  message("This method was available in V1 of the API, but appears down now, will update again if becomes avaialable again.")
#   args <- list(op = "NameGetDetail", apikey = key, format = format)
#   if (!is.na(namebankid)) 
#     args$namebankid <- namebankid
#   if (!is.na(name)) 
#     args$name <- name
#   message(query2message(url, args))
#   tt <- getForm(url, .params = args, ..., curl = curl)
#   fromJSON(I(tt))
}