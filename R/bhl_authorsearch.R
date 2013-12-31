#' Return a list of authors that match (fully or partially) the specified 
#'    search string. 
#'    
#' The namessearched are those contained in MARC 100a, 110a, 111a, 700a, 
#'    710a, and 711a library records.
#'
#' @import httr 
#' @importFrom plyr compact
#' @param name full or partial name of the author for which to search
#'     (last name listed first, i.e. 'Darwin, Charles') (character)
#' @param format either XML ("xml") or JSON ("json") format
#' @param key your BHL API key, either enter, or loads from .Rprofile
#' @param callopts Call options passed on to httr::GET.
#' @param output Return a list, raw json or xml, or parsed data (character). 
#'    Default: 'list'
#' @export
#' @examples \dontrun{
#' bhl_authorsearch(name='dimmock')
#' bhl_authorsearch(name='Jones')
#' }
bhl_authorsearch <- function(name = NULL, format = "json", output='list',
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts=list())
{
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op="AuthorSearch", name=name, apikey=key, format=format))
  out <- GET(url, query=args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  if(output=='raw'){
    return( tt )
  } else if(output=='list'){
    return( fromJSON(I(tt)) )
  } else
  {
    return( if(format=="json"){ return(fromJSON(I(tt))) } else{ return(xmlTreeParse(I(tt))) } )
  }
#   tt <- lapply(tt, function(x){
#     x[sapply(x, is.null)] <- ""
#     x
#   })
#   return( data.frame(rbindlist(tt)) )
}