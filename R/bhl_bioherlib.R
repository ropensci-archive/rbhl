#' Search BHL across many API methods.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param method The API method to use.
#' @param pageid The identifier of an individual page in a scanned book.
#' @param ocr return ocr text of the page (logical). Default: FALSE
#' @param names return the names that appear on the page (logical). Default: FALSE
#' @inheritParams bhl_authorsearch
#' @export
#' @examples \dontrun{
#' bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE)
#' bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, format="xml")
#' bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, raw=TRUE)
#' }
bhl_bioherlib <- function(method = 'GetPageMetadata', pageid = NULL, ocr = FALSE, 
  names = FALSE, format = 'json', key = getOption("BioHerLibKey", 
  stop("need an API key for the BHL")), output='list', callopts = list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  method <- match.arg(method, 
    choices=c('GetPageMetadata', 'GetPageOcrText', 'GetPageNames',
     'GetItemMetadata', 'GetItemByIdentifier', 'GetItemPages', 'GetUnpublishedItems',
     'GetTitleMetadata', 'GetTitleItems', 'GetTitleByIdentifier', 'TitleSearchSimple',
     'GetTitleBibTex', 'GetTitleEndNote', 'GetUnpublishedTitles', 'SubjectSearch',
     'GetSubjectTitles', 'AuthorSearch', 'GetAuthorTitles', 'NameCount', 'NameList',
     'NameGetDetail', 'NameSearch', 'GetCollections', 'GetLanguages'))
  args <- compact(list(apikey=key, op=method, pageid=pageid, format=format, 
                       ocr=ocr, names=names))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  if(output=='raw'){
    return( tt )
  } else if(output=='list'){
    return( fromJSON(I(tt)) )
  } else
  {
    if(format=="json"){ return(fromJSON(I(tt))) } else{ return(xmlTreeParse(I(tt))) }
  }
}