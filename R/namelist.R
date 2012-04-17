#' namelist
#'
#' @import RCurl RJSONIO
#' @param startrow first name to return (if using as an offset)
#' @param batchsize number of names to return (numeric)
#' @param startdate (optional) start date of range between which to count names (date)
#' @param enddate (optional) end date of range between which to count names (date)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' namelist(1, 1000, '10/15/2009', '10/31/2009')
#' }
namelist <- function(startrow = NA, batchsize = NA, startdate = NA, enddate = NA, 
  format = "json", url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "NameList", apikey = key, format = format)
    if (!is.na(startrow)) 
        args$startrow <- startrow
    if (!is.na(batchsize)) 
        args$batchsize <- batchsize
    if (!is.na(startdate)) 
        args$startdate <- startdate
    if (!is.na(enddate)) 
        args$enddate <- enddate
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}