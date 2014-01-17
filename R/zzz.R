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
#' @importFrom XML xmlTreeParse
#' @importFrom RJSONIO fromJSON
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

#' Function to get API key. 
#' 
#' Checks first to get key from your .Rprofile file for an API key with the 
#' name 'BioHerLibKey'. If it is not found, the default key is used. 
#' 
#' @param x An API key, defaults to NULL.
#' @examples \dontrun{
#' getkey()
#' } 
#' @keywords internal
#' @export
getkey <- function(x = NULL, service) {        
  if(is.null(x)){
    key <- getOption('BioHerLibKey')
    if(is.null(key)){
      key <- "8f7e89db-2ec3-4408-a160-c3dc416b118d"
      url <- "http://www.biodiversitylibrary.org/getapikey.aspx"
      message(paste("Using default key: Please get your own API key at ", 
                    url, sep=""))
    } else 
      if(class(key)=="character"){key <- key} else 
      { stop("check your key input - it should be a character string") }
  } else 
  { key <- x }
  key
}

# .onLoad <- function(...){
#   tools::vignetteEngine("knitr", weave = function(...) encoding='utf-8', tangle = vtangle,
#                       pattern = "[.]Rmd$", package = "knitr")
# }