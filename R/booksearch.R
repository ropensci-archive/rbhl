#' Search for titles and items in BHL. 
#' 
#' Search criteria includes title, author last name, volume, edition, year of 
#'    publication, subject, language code, and collection identifier. Valid 
#'    language codes and collection identifiers can be obtained from the 
#'    getlanguages and getcollections functions. If year of publication is 
#'    specified, it should be a 4-digit year. To execute a search, you must 
#'    supply at least a title, author last name, or collection identifier.
#'
#' @import RCurl RJSONIO
#' @param title string to search for in the title (character)
#' @param lname last name to search for (character)
#' @param volume volume to search for (numeric)
#' @param edition edition to search for (character)
#' @param year year to search for, four characters, e.g, 1970 (numeric)
#' @param collectionid collection identifier to search for (numeric)
#' @param language language to search for (character)
#' @inheritParams authorsearch
#' @seealso \code{\link{getcollections}, \link{getlanguages}}
#' @examples \dontrun{
#' booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825, collectionid=4, language='eng')
#' out <- booksearch('evolution')
#' # Note  --Use getcollections() or getlanguages() to get acceptable terms
#' }
#' @export
booksearch <- function(title = NA, lname = NA, volume = NA, 
    edition = NA, year = NA, collectionid = NA, language = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "BookSearch", apikey = key, format = format)
    if (!is.na(title)) 
        args$title <- title
    if (!is.na(lname)) 
        args$lname <- lname
    if (!is.na(volume)) 
        args$volume <- volume
    if (!is.na(edition)) 
        args$edition <- edition
    if (!is.na(year)) 
        args$year <- year
    if (!is.na(collectionid)) 
        args$collectionid <- collectionid
    if (!is.na(language)) 
        args$language <- language
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    fromJSON(I(tt))
}