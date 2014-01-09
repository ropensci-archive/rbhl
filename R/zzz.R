#' Internal function to convert API query to message printed in the console.
#' 
#' @param url The base url for the API.
#' @param x List of named parameters to be used in API call. 
#' @examples \donttest{
#' url <- "http://ropensci.org/"
#' args <- list(species='frog',author='joe')
#' message(query2message(url, args))
#' } 
#' @export
query2message <- function(url, x) {
  mylist <- list()
  for(i in 1:length(x)) {
    mylist[i] <- paste(names(x[i]), '=', x[i][[1]], sep='')
  }
  paste('API call:\n', paste(url, "?", paste(mylist, collapse="&"), sep=''))
}

#' Internal function to parse results from functions
#' @param x Raw json or xml data object
#' @param y Output format, one of 'raw', 'list', or 'parsed'
#' @param z Format, one of 'json' or 'xml'
#' @export
#' @keywords internal
return_results <- function(x, y, z){
  if(y=='raw'){
    return( x )
  } else if(y=='list')
  {
    return( fromJSON(I(x)) )
  } else
  {
    if(z=="json"){ return(fromJSON(I(x))) } else{ return(xmlTreeParse(I(x))) }
  } 
}