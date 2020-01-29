#' Not sure how this differs from their other API...
#'
#' @export
#' @param genre Book genre
#' @param title Book title
#' @param aufirst First author
#' @param aulast Last author
#' @param date Date of publication
#' @param spage Start page
#' @param issue Issue number
#' @param version One of 0.1 or 1.0
#' @inheritParams bhl_getcollections
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
#'    aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16)
#'
#' bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
#'    aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16,
#'    as='xml')
#' }

bhl_openurl <- function(genre = NULL, title = NULL, aufirst = NULL,
  aulast = NULL, date = NULL, spage = NULL, issue = NULL, version = 0.1,
  as = "list", key = NULL, ...) {

  url_ver <- if (version == "1.0") "z39.88-2004" else NULL
	args <- bhlc(list(genre = genre, title = title, aufirst = aufirst,
							 date = date, spage = spage, issue = issue, url_ver = url_ver,
							 apikey = check_key(key), format = as_f(as)))
	if (length(args) == 0) args <- NULL
	out <- crul::HttpClient$new(
	  url = "https://www.biodiversitylibrary.org/openurl", opts = list(...)
	)$get(query = args)
	out$raise_for_status()
	tt <- out$parse("UTF-8")
  switch(as, json = tt, xml = tt, list = fjson(tt), table = todf(tt))
}
