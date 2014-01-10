#' Return the number of unique names found on pages in BHL. 
#' 
#' Names both with and without NameBank  identifiers are counted.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param startdate start date of range between which to count names (optional)
#' @param enddate end date of range between which to count names (optional)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_namecount(startdate = '10/15/2009', enddate = '10/17/2009')
#' bhl_namecount(startdate = '10/15/2009', enddate = '10/17/2009', output='raw')
#' bhl_namecount(startdate = '10/15/2009', enddate = '10/17/2009', format='xml', output='raw')
#' bhl_namecount(startdate = '10/15/2009', enddate = '10/17/2009', format='xml', output='parsed')
#' }
#' @export
bhl_namecount <- function(startdate = NULL, enddate = NULL, format = "json",
  output='list', key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts=list()) 
{
  message("This method was available in V1 of the API, but appears down now, will update again if becomes avaialable again.")
#   if(output=='list') format='json'
#   url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
#   args <- compact(list(op = "NameCount", apikey = key, format = format,
#                        startdate=startdate, enddate=enddate))
#   out <- GET(url, query = args, callopts)
#   stop_for_status(out)
#   tt <- content(out, as="text")
#   return_results(tt, output, format)
}