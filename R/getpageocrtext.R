#' getpageocrtext
#'
#' @import RCurl RJSONIO XML
#' @param page page number to get
#' @param ocrtext return ocr text of the page (TRUE/FALSE)
#' @param names return the names that appear on the page (TRUE/FALSE)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' getpageocrtext('1328690', FALSE, FALSE, 'json')
#' }
getpageocrtext <- function(page = NA, ocrtext = FALSE, names = FALSE, format = NA, 
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "GetPageOcrText", apikey = key)
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
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    outprod
} 