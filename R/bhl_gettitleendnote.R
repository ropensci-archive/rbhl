#' Return a citation for a title, using the EndNote format.
#'
#' @import httr
#' @importFrom plyr compact
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_gettitleendNote(1726)
#' }
#' @export
bhl_gettitleendNote <- function(titleid = NA,
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts=list()) 
{
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleEndNote", apikey = key, format = 'json', titleid=titleid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out)
  gsub("\n|%.{1}", "", tt$Result)
}