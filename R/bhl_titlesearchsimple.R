#' Perform a simple title search. 
#' 
#' The full title (as specified in MARC 245a and MARC 245b library records) 
#'    is searched for the specified string. Basic metadata for all full and 
#'    partial matches is returned.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param title full or partial title for which to search (character)
#' @examples \dontrun{
#' bhl_titlesearchsimple('nematocerous')
#' bhl_titlesearchsimple('husbandry')
#' }
#' @export
bhl_titlesearchsimple <- function(title = NA, format = "json",
  key = NULL, output='list', callopts=list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "TitleSearchSimple", apikey = key, format = format, title=title))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}