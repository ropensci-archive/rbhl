#' Return a citation for a title, using the EndNote format.
#'
#' @import httr
#' @importFrom plyr compact
#' @param titleid the identifier of an individual title (numeric)
#' @param key your BHL API key, either enter, or loads from .Rprofile
#' @param callopts Call options passed on to httr::GET.
#' @examples \dontrun{
#' bhl_gettitleendNote(1726)
#' }
#' @export
bhl_gettitleendNote <- function(titleid = NA, key = NULL, callopts=list())
{
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetTitleEndNote", apikey = check_key(key), format = 'json', titleid=titleid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out)
  gsub("\n|%.{1}", "", tt$Result)
}
