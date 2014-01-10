#' Return a list of subjects that match (fully or partially) the specified 
#'    search string.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param subject the full or partial subject for which to search (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_subjectsearch('diptera')
#' }
#' @export
bhl_subjectsearch <- function(subject = NA, format = "json", 
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  output='list', callopts=list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "SubjectSearch", apikey = key, format = format, 
                       subject = subject))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}