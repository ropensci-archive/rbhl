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