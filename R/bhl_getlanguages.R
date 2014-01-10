#' Get a list of languages in which materials in BHL have been written.
#'
#' @import httr
#' @importFrom RJSONIO fromJSON
#' @importFrom plyr compact ldply
#' @importFrom XML xmlTreeParse
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getlanguages()
#' bhl_getlanguages(output='parsed')
#' bhl_getlanguages(output='raw')
#' bhl_getlanguages(output='raw', format='xml')
#' }
#' @export
bhl_getlanguages <- function(format = "json", output='list',
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts = list())
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetLanguages", apikey = key, format = format))
  out <- GET(url, query = args, callopts)
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