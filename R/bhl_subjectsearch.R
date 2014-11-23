#' Return a list of subjects that match (fully or partially) the specified
#'    search string.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param subject the full or partial subject for which to search (character)
#' @examples \dontrun{
#' bhl_subjectsearch('diptera')
#' }
#' @export
bhl_subjectsearch <- function(subject = NA, format = "json",
  key = NULL, output='list', ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "SubjectSearch", apikey = check_key(key), format = format,
                       subject = subject))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
