#' Get a list of collections which are used to group titles and items. A single
#'    collection may contain either titles or items, but not both.
#'
#' @export
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom plyr compact ldply rbind.fill
#' @template all
#' @examples \dontrun{
#' bhl_getcollections()
#' bhl_getcollections(as = 'list')
#' bhl_getcollections(as = 'json')
#' bhl_getcollections(as = 'xml')
#' }

bhl_getcollections <- function(as='table', key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- compact(list(op = "GetCollections", apikey = check_key(key), format = format))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  switch(as, json = tt, xml = tt, list = fjson(tt), table = todf(tt))
}

todf <- function(x){
  do.call(rbind.fill, lapply(jsonlite::fromJSON(I(x), FALSE)$Result, data.frame))
}

fjson <- function(x) jsonlite::fromJSON(x, FALSE)

bhl_url <- function() "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
