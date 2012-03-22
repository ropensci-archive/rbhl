#'GetTitleBibTex.R
#'
#'<longer description>
#'@param key API key
#'@param titleid: the identifier of an individual title (numeric)
#'@param justresult: just print result? (TRUE/FALSE)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'GetTitleBibTex('1726')
#'GetTitleBibTex('1726', TRUE)
#'}
GetTitleBibTex <- function(titleid = NA, justresult = FALSE, 
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetTitleBibTex", apikey = key, format = format)
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
