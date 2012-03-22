#'GetTitleByIdentifier.R
#'
#'<longer description>
#'@param 'BioHerLibKey' <what param does>
#'@param  type: the type of identifier (oclc, issn, isbn, lccn, ddc, nal, nlm, coden) character
#'@param   value: the identifier value (numeric)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' GetTitleByIdentifier('oclc', 2992225)
#'}
GetTitleByIdentifier <- function(type = NA, value, 
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetTitleByIdentifier", apikey = key, format = format)
    if (!is.na(type)) 
        args$type <- type
    if (!is.na(value)) 
        args$value <- value
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
