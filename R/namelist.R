#' List the unique names. 
#' 
#' By using the startrow and batchsize parameters appropriately, you can
#'    pull the list all at once, or in batches (i.e. 1000 names at a time). 
#'    Names both with and without NameBank identifiers are returned.
#'
#' @import RCurl RJSONIO
#' @param startrow first name to return (if using as an offset)
#' @param batchsize number of names to return (numeric)
#' @param startdate (optional) start date of range between which to count names (date)
#' @param enddate (optional) end date of range between which to count names (date)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' namelist(1, 1000, '10/15/2009', '10/31/2009')
#' }
#' @export
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
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}