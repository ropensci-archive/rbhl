#' Return a list of parts (articles, chapters, etc) associated with a subject.
#'
#' Note: haven't seen examples for this function that work yet...
#'
#' @export
#' @param subject the full or partial subject for which to search (character)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getsubjectparts('frogs')
#' bhl_getsubjectparts('diptera', 'xml')
#' bhl_getsubjectparts('diptera', 'json')
#' }

bhl_getsubjectparts <- function(subject = NULL, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetSubjectParts", apikey = check_key(key), format = format,
                       subject = subject))
  bhl_GET(as, args, ...)
}
