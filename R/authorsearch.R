#' Return a list of authors that match (fully or partially) the specified 
#'    search string. 
#'    
#' The namessearched are those contained in MARC 100a, 110a, 111a, 700a, 
#'    710a, and 711a library records.
#'
#' @import RCurl RJSONIO
#' @param name full or partial name of the author for which to search
#'     (last name listed first, i.e. 'Darwin, Charles') (character)
#' @param format either XML ("xml") or JSON ("json") format
#' @param url the BHL API url for the function (should be left to default)
#' @param key your BHL API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @examples \dontrun{
#' authorsearch(name='dimmock')
#' }
#' @export
authorsearch <- function(name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
  args <- list(op = "AuthorSearch", apikey = key, format = format)
  if (!is.na(name)) 
    args$name <- name
  message(query2message(url, args))
  tt <- getForm(url, 
  							.params = args, 
  							..., 
  							curl = curl)
  bbb <- fromJSON(I(tt))$Result
  temp <- do.call(rbind, llply(bbb, function(x) t(ldply(x))))
	row.names(temp) <- NULL
  df <- data.frame(temp)
 	df2 <- df[!df$X1 %in% "CreatorID", ]
  names(df2) <- names(bbb[[1]][!sapply(bbb[[1]], is.null)])
 	df2
}