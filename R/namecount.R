#' namecount
#'
#' @import RCurl RJSONIO
#' @param startdate start date of range between which to count names (optional)
#' @param enddate end date of range between which to count names (optional)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' namecount(startdate = '10/15/2009', enddate = '10/17/2009')
#' }
namecount <- function(startdate = NA, enddate = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "NameCount", apikey = key, format = format)
  if (!is.na(startdate)) 
      args$startdate <- startdate
  if (!is.na(enddate)) 
      args$enddate <- enddate
  tt <- getForm(url, .params = args, ..., curl = curl)
  fromJSON(I(tt))
}