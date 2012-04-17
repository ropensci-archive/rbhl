#' gettitlemetadata
#'
#' @import RCurl RJSONIO
#' @param titleid the identifier of an individual title (numeric)
#' @param items logical
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' gettitlemetadata(1726, TRUE)
#' }
gettitlemetadata <- function(titleid = NA, items = FALSE, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetTitleMetadata", apikey = key, format = format)
    if (!is.na(titleid)) 
        args$titleid <- titleid
    if (items == "TRUE") {
        args$items <- "t"
    } else if (items == "FALSE") {
        args$items <- NULL
    }
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}