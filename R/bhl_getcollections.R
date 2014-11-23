#' Get a list of collections which are used to group titles and items. A single
#'    collection may contain either titles or items, but not both.
#'
#' @export
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom plyr compact ldply
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
  url <- "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetCollections", apikey = check_key(key), format = format))
  out <- GET(url, query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  switch(as, json = tt, xml = tt,
         list = jsonlite::fromJSON(tt, FALSE),
         table = todf(tt))
}

todf <- function(x){
  do.call(rbind.fill, lapply(jsonlite::fromJSON(I(x), FALSE)$Result, data.frame))
}
