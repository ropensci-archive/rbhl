#' Return a list of parts (articles, chapters, etc) associated with a subject.
#' 
#' Note: haven't seen examples for this function that work yet...
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param subject the full or partial subject for which to search (character)
#' @examples \dontrun{
#' bhl_getsubjectparts('frogs')
#' bhl_getsubjectparts('diptera', 'xml', 'raw')
#' bhl_getsubjectparts('diptera', 'xml', 'parsed')
#' }
#' @export
bhl_getsubjectparts <- function(subject = NULL, format = "json", output = 'list', 
  key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetSubjectParts", apikey = key, format = format,
                       subject = subject))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}