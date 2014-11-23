#' Return a list of titles associated with a subject.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param subject the full or partial subject for which to search (character)
#' @examples \dontrun{
#' bhl_getsubjecttitles('diptera')
#' bhl_getsubjecttitles('diptera', 'xml', 'raw')
#' bhl_getsubjecttitles('diptera', 'xml', 'parsed')
#' }
#' @export
bhl_getsubjecttitles <- function(subject = NULL, format = "json", output = 'list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetSubjectTitles", apikey = check_key(key), format = format,
                       subject = subject))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
