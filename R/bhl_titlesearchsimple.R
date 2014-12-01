#' Perform a simple title search.
#'
#' The full title (as specified in MARC 245a and MARC 245b library records)
#'    is searched for the specified string. Basic metadata for all full and
#'    partial matches is returned.
#'
#' @export
#'
#' @param title full or partial title for which to search (character)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_titlesearchsimple('nematocerous')
#' bhl_titlesearchsimple('husbandry')
#' }
bhl_titlesearchsimple <- function(title = NA, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- compact(list(op = "TitleSearchSimple", apikey = check_key(key), format = format, title=title))
  bhl_GET(as, args, ...)
}
