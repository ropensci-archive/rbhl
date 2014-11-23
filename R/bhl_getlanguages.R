#' Get a list of languages in which materials in BHL have been written.
#'
#' @import httr
#' @importFrom RJSONIO fromJSON
#' @importFrom plyr compact ldply
#' @importFrom XML xmlTreeParse
#' @template all
#' @examples \dontrun{
#' bhl_getlanguages()
#' bhl_getlanguages(output='parsed')
#' bhl_getlanguages(output='raw')
#' bhl_getlanguages(output='raw', format='xml')
#' }
#' @export
bhl_getlanguages <- function(format = "json", output='list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op = "GetLanguages", apikey = check_key(key), format = format))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  if(output=='raw'){
    return( tt )
  } else if(output=='list')
  {
    return( fromJSON(I(tt)) )
  } else
  {
    if(format=="json"){ return(ldply(fromJSON(I(tt))$Result, identity)) } else{ return(xmlTreeParse(I(tt))) }
  }
}
