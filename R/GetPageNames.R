#'GetPageNames.R
#'
#'<longer description>
#'@param 'BioHerLibKey' <what param does>
#'@param   page: page number to get
#'@param  format: json or xml (character)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'GetPageNames('1328690', 'json')
#'}
GetPageNames <- function(page = NA, format = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) {
    args <- list(op = "GetPageNames", apikey = key)
    if (!is.na(page)) 
        args$pageid <- page
    if (!is.na(format)) 
        args$format <- format
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    return(outprod)
} 
