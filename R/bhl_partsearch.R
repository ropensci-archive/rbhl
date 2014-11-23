#' Search for parts of books in BHL, such as articles, chapters, or treatments. 
#' Search criteria includes title, container (journal or book title), author, 
#' date of publication, volume, series, and issue.
#' 
#' To execute a search, you must supply at least a title or author.
#' 
#' The metadata returned by this method includes Part Identifier, Part URL, Item ID, 
#' Page ID for the start page, Genre, Title, Container Title, Publication Details, 
#' Volume, Series, Issue, Date, Page Range, Language, rights information, authors, 
#' keywords, identifiers, pages, and related parts. For more information, see the 
#' "Data Elements" section of this documentation.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param title Title of the work
#' @param containerTitle Container title of the work
#' @param author Author of the work
#' @param date Date of the work
#' @param volume Volume of the work
#' @param series Series of the work
#' @param issue Issue of the work
#' @examples \dontrun{
#' bhl_partsearch(title='Critical approach to the definition of Darwinian units')
#' bhl_partsearch(author='Charles Darwin')
#' }
#' @export
bhl_partsearch <- function(title=NULL, containerTitle=NULL, author=NULL, date=NULL, 
  volume=NULL, series=NULL, issue=NULL, format = "json", key = NULL, output='list', 
  callopts=list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "PartSearch", apikey = key, format = format, 
                       title = title, containerTitle=containerTitle, author=author,
                       date=date, volume=volume, series=series, issue=issue))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}