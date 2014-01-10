#' Not sure how this differs from their other API... 
#' 
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
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
#' @param output Output format, one of list, raw, or parsed
#' @param callopts Options to pass on to httr::GET
#' @examples \dontrun{
#' bhl_openurl(
#' 	genre="book", 
#' 	title="Manual+of+North+American+Diptera", 
#' 	aufirst="Samuel Wendell", 
#' 	aulast="Williston", 
#' 	date=1908, 
#' 	spage=16)
#'   
#' bhl_openurl(genre="book", title="Manual+of+North+American+Diptera", 
#'    aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16, output='raw')
#'    
#' bhl_openurl(genre="book", title="Manual+of+North+American+Diptera", 
#'    aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16, output='parsed')
#'    
#' bhl_openurl(genre="book", title="Manual+of+North+American+Diptera", 
#'    aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16, 
#'    format='xml', output='parsed')
#' }
#' @export
bhl_openurl <- function(genre = NULL, title = NULL, aufirst = NULL, aulast = NULL, 
	date = NULL, spage = NULL, issue = NULL, version = 0.1, format = "json",
  key = getOption("BioHerLibKey", stop("need an API key for the BHl")),
  output='list', callopts=list()) 
{
	url = "http://www.biodiversitylibrary.org/openurl"
  if(version=="1.0"){url_ver <- "z39.88-2004"} else {url_ver <- NULL}
	args <- compact(list(genre = genre, title = title, aufirst = aufirst,
							 date = date, spage = spage, issue = issue, url_ver = url_ver,
							 apikey = key, format = format))  
	out <- GET(url, query = args, callopts)
	stop_for_status(out)
	tt <- content(out, as="text")
	return_results(tt, output, format)
}