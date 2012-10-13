#' Get basic title, item, and page metadata for each page on which the specified name appears.
#'
#' @import RCurl RJSONIO
#' @param namebankid (not used if 'name' specified) NameBank identifier for a name (numeric)
#' @param name (not used if 'namebankid' specified) a complete name string (character)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' namegetdetail(namebankid = 3501464)
#' namegetdetail(name = 'poa annua supina')
#' }
#' @export
namegetdetail <- function(namebankid = NA, name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "NameGetDetail", apikey = key, format = format)
    if (!is.na(namebankid)) 
        args$namebankid <- namebankid
    if (!is.na(name)) 
        args$name <- name
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}