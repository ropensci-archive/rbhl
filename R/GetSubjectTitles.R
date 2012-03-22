#'GetSubjectTitles.R
#'
#'<longer description>
#'@param key API key
#'@param  subject: the full or partial subject for which to search (character)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'GetSubjectTitles('diptera')
#'}
GetSubjectTitles <- function(subject = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "GetSubjectTitles", apikey = key, format = format)
    if (!is.na(subject)) 
        args$subject <- subject
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
