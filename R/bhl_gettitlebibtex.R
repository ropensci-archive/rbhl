#' Return a citation for a title, using the BibTeX format.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_gettitlebibTex(1726)
#' bhl_gettitlebibTex(1726, output='raw')
#' bhl_gettitlebibTex(1726, format='xml', output='raw')
#' bhl_gettitlebibTex(1726, format='xml', output='parsed')
#' }
#' @export
bhl_gettitlebibTex <- function(titleid = NULL, format = "json", 
  output='list', key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts=list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleBibTex", apikey = key, format = format, titleid=titleid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}