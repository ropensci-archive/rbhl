#' Get a list of collections which are used to group titles and items. A single 
#'    collection may contain either titles or items, but not both.
#'
#' @import httr
#' @importFrom plyr compact
#' @param asdf Print results as a data.frame (logical).
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getcollections()
#' bhl_getcollections(out = 'raw')
#' }
#' @export
bhl_getcollections <- function(format = "json", output='list',
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts = list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetCollections", apikey = key, format = format))
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
    return( ldply(temp$Result, function(x) as.data.frame(x)) )
  }
}