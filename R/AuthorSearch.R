#'AuthorSearch.R
#'
#'<longer description>
#'@param key API Key
#'@param  Name full or partial name of the author for which to search
#     (last name listed first, i.e. 'Darwin, Charles') (character)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#' AuthorSearch('dimmock')
#'}
AuthorSearch <- function(name = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle(), format = "json") {
    args <- list(op = "AuthorSearch", apikey = key, format = format)
    if (!is.na(name)) 
        args$name <- name
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
} 
