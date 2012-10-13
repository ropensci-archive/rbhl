#' Search BHL across many API methods. 
#'
#' @import RCurl RJSONIO XML
#' @param ocrtext return ocr text of the page (TRUE/FALSE)
#' @param names return the names that appear on the page (TRUE/FALSE)
#' @param method The API method to use.
#' @param page The identifier of an individual page in a scanned book.
#' @inheritParams authorsearch
#' @examples \dontrun{
#' bioherlib(method='GetPageMetadata', page='1328690', ocrtext=TRUE, names=TRUE, format='json')
#' bioherlib('GetPageNames', '1328690', 'TRUE', 'TRUE', 'json')
#' }
#' @export
bioherlib <- function(method = list('GetPageMetadata', 'GetPageOcrText', 'GetPageNames',
  'GetItemMetadata', 'GetItemByIdentifier', 'GetItemPages', 'GetUnpublishedItems',
  'GetTitleMetadata', 'GetTitleItems', 'GetTitleByIdentifier', 'TitleSearchSimple',
  'GetTitleBibTex', 'GetTitleEndNote', 'GetUnpublishedTitles', 'SubjectSearch',
  'GetSubjectTitles', 'AuthorSearch', 'GetAuthorTitles', 'NameCount', 'NameList',
  'NameGetDetail', 'NameSearch', 'GetCollections', 'GetLanguages'), 
  page = NA, ocrtext = FALSE, names = FALSE, format = NA, 
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    method <- match.arg(method, 
    	choices=list('GetPageMetadata', 'GetPageOcrText', 'GetPageNames',
    		'GetItemMetadata', 'GetItemByIdentifier', 'GetItemPages', 'GetUnpublishedItems',
    		'GetTitleMetadata', 'GetTitleItems', 'GetTitleByIdentifier', 'TitleSearchSimple',
    		'GetTitleBibTex', 'GetTitleEndNote', 'GetUnpublishedTitles', 'SubjectSearch',
    		'GetSubjectTitles', 'AuthorSearch', 'GetAuthorTitles', 'NameCount', 'NameList',
    		'NameGetDetail', 'NameSearch', 'GetCollections', 'GetLanguages'))
    args <- list(apikey = key)
    if (!is.na(method)) 
        args$op <- method
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