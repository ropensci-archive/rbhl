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
#' @param x Raw json or xml data object
#' @param y Output format, one of 'raw', 'list', or 'parsed'
#' @param z Format, one of 'json' or 'xml'
#' @export
#' @keywords internal
return_results <- function(x, y, z) {
  if(y=='raw') {
    return( x )
  } else if(y=='list') {
    return( jsonlite::fromJSON(I(x)) )
  } else {
    if (z == "json") {
      return(jsonlite::fromJSON(I(x)))
    } else {
      return(XML::xmlTreeParse(I(x)))
    }
  }
}

check_key <- function(x) {
  tmp <- if (is.null(x)) Sys.getenv("BHL_KEY", "") else x
  if(tmp == "") getOption("bhl_key", stop("need an API key for BHL")) else tmp
}

bhl_GET <- function(as, args, ...){
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as = "text")
  switch(as, json = tt, xml = tt, list = fjson(tt), table = todf(tt))
}

todf <- function(x){
  temp <- jsonlite::fromJSON(I(x), TRUE)$Result
  if(is.character(temp)){
    temp
  } else {
    if(!is.null(names(temp))){
      data.frame(bhlc(temp), stringsAsFactors = FALSE)
    } else {
      do.call(rbind.fill, lapply(bhlc(temp), data.frame))
    }
  }
}

fjson <- function(x) jsonlite::fromJSON(x, FALSE)

bhl_url <- function() "http://www.biodiversitylibrary.org/api2/httpquery.ashx"

bhlc <- function (l) Filter(Negate(is.null), l)

as_f <- function(x){
  as <- match.arg(x, c("table","list","json","xml"))
  if(as %in% c('list','table','json')) 'json' else 'xml'
}
