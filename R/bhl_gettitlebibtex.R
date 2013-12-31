#' Return a citation for a title, using the BibTeX format.
#'
#' @import RCurl RJSONIO
#' @param titleid the identifier of an individual title (numeric)
#' @param justresult just print result? (TRUE/FALSE)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_gettitlebibTex('1726')
#' bhl_gettitlebibTex('1726', TRUE)
#' }
#' @export
bhl_gettitlebibTex <- function(titleid = NA, justresult = FALSE, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetTitleBibTex", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    temp <- fromJSON(I(tt))
    if (!justresult == TRUE) {
        temp
    } else {
        temp$Result
    }
}