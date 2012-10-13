#' Return a citation for a title, using the EndNote format.
#'
#' @import RCurl RJSONIO
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' gettitleendNote('1726')
#' }
#' @export
gettitleendNote <- function(titleid = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetTitleEndNote", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    message(query2message(url, args))
    tt <- getForm(url, 
    					.params = args, 
    					..., 
    					curl = curl)
    temp <- fromJSON(I(tt))
    gsub("\n|%.{1}", "", temp$Result)
}