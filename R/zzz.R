#' Internal function to convert API query to message printed in the console.
#'
#' @param x List of named parameters to be used in API call. 
#' @examples \dontrun{
#' message(query2message(args))
#' } 
query2message <- function(x) {
  mylist <- list()
  for(i in 1:length(x)) {
    mylist[i] <- paste(names(x[i]), '=', x[i][[1]], sep='')
  }
  paste('API call:\n', paste(url, "?", paste(mylist, collapse="&"), sep=''))
}