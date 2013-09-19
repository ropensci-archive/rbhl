#' Not sure how this differs from their other API... 
#' 
#' @import RCurl RJSONIO
#' @param genre Book genre
#' @param title Book title
#' @param aufirst First author
#' @param aulast Last author
#' @param date Date of publication
#' @param spage Start page
#' @param issue Issue number
#' @param version One of 0.1 or 1.0 
#' @param format either XML ("xml") or JSON ("json") format
#' @param key your BHL API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @examples \dontrun{
#' openurl(
#' 	genre="book", 
#' 	title="Manual+of+North+American+Diptera", 
#' 	aufirst="Samuel Wendell", 
#' 	aulast="Williston", 
#' 	date=1908, 
#' 	spage=16)
#' }
#' @export
openurl <- function(genre = NULL, title = NULL, aufirst = NULL, aulast = NULL, 
	date = NULL, spage = NULL, issue = NULL, version = 0.1, format = "json",
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library"))) 
{
	url = "http://www.biodiversitylibrary.org/openurl"
  if(version=="1.0"){url_ver <- "z39.88-2004"} else {url_ver <- NULL}
	args <- compact(list(genre = genre, title = title, aufirst = aufirst, 
							 date = date, spage = spage, issue = issue, url_ver = url_ver,
							 apikey = key, format = format))
  message(query2message(url, args))
	out <- fromJSON(content(GET(url, query=args)))
	
  return( out )
}