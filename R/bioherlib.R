#'bioherlib.R
#'
#'<longer description>
#'@param key API Key
#'@param  ocrtext: return ocr text of the page (TRUE/FALSE)
#'@param  names: return the names that appear on the page (TRUE/FALSE)
#'@param   format: json or xml (character)
#'@keywords
#'@seealso
#'@return
#'@alias
#'@export
#'@examples \dontrun{
#'bioherlib(method = 'GetTitleMetadata', page = '1328690', format = 'json')
#'bioherlib('GetPageMetadata', '1328690', 'TRUE', 'TRUE', 'json')
#'bioherlib('GetPageNames', '1328690', 'TRUE', 'TRUE', 'json')
#'}
bioherlib <- function(method = NA, page = NA, ocrtext = FALSE, 
    names = FALSE, format = NA, url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
    ..., curl = getCurlHandle()) {
    args <- list(op = method, apikey = key)
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
    tt <- getForm(url, .params = args, ..., curl = curl)
    if (format == "json") {
        outprod <- fromJSON(I(tt))
    } else if (format == "xml") {
        outprod <- xmlTreeParse(I(tt))
    }
    return(outprod)
}
# Extra stuff:
#   method: API method: GetPageMetadata, GetPageOcrText, GetPageNames,
#     GetItemMetadata, GetItemByIdentifier, GetItemPages, GetUnpublishedItems,
#     GetTitleMetadata, GetTitleItems, GetTitleByIdentifier, TitleSearchSimple,
#     GetTitleBibTex, GetTitleEndNote, GetUnpublishedTitles, SubjectSearch,
#     GetSubjectTitles, AuthorSearch, GetAuthorTitles, NameCount, NameList,
#     NameGetDetail, NameSearch, GetCollections, GetLanguages 
