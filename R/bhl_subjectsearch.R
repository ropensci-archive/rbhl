#' Return a list of subjects that match (fully or partially) the specified
#'    search string.
#'
#' @export
#'
#' @param subject the full or partial subject for which to search (character)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_subjectsearch('diptera')
#' bhl_subjectsearch('diptera', "json")
#' }
bhl_subjectsearch <- function(subject, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "SubjectSearch", apikey = check_key(key), format = format,
                       subject = subject))
  bhl_GET(as, args, ...)
}
