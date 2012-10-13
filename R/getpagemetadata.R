#' Return metadata about a page. 
#' 
#' You may choose to include the OCR text and a list of names found on the page.
#'
#' @import RCurl RJSONIO XML
#' @param page page number to get
#' @param ocrtext return ocr text of the page (TRUE/FALSE)
#' @param names return the names that appear on the page (TRUE/FALSE)
#' @inheritParams authorsearch
#' @examples \dontrun{
#' getpagemetadata('1328690', FALSE, FALSE, 'json')
#' }
#' @export
getpagemetadata <- function(page = NA, ocrtext = FALSE, 
    names = FALSE, format = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetPageMetadata", apikey = key)
    if (!is.na(page)) 
        args$pageid <- page
    if (!is.na(format)) 
        args$format <- format
    if (ocrtext == "TRUE") {
        args$ocr <- "t"
    } else if (ocrtext == "FALSE") {
        args$ocr <- NULL
    }
    if (names == "TRUE") {
        args$names <- "t"
    } else if (names == "FALSE") {
        args$names <- NULL
    }
    message(query2message(url, args))
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    outprod
}