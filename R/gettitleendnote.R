#' gettitleendNote
#'
#' @import RCurl RJSONIO
#' @param titleid the identifier of an individual title (numeric)
#' @param justresult just print result? (TRUE/FALSE)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' gettitleendNote('1726')
#' gettitleendNote('1726', TRUE)
#' }
gettitleendNote <- function(titleid = NA, justresult = FALSE, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetTitleEndNote", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    tt <- getForm(url, .params = args, ..., curl = curl)
    temp <- fromJSON(I(tt))
    if (!justresult == TRUE) {
        temp
    } else {
        temp$Result
    }
}