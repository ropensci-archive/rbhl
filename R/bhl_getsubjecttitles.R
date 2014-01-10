#' Return a list of titles associated with a subject.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param subject the full or partial subject for which to search (character)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getsubjecttitles('diptera')
#' bhl_getsubjecttitles('diptera', 'xml', 'raw')
#' bhl_getsubjecttitles('diptera', 'xml', 'parsed')
#' }
#' @export
bhl_getsubjecttitles <- function(subject = NULL, format = "json", output = 'list', 
  key = getOption("BioHerLibKey", stop("need an API key for the BHl")), 
  callopts = list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetSubjectTitles", apikey = key, format = format,
                       subject = subject))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}