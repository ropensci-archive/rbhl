#' Return metadata about a page. 
#' 
#' You may choose to include the OCR text and a list of names found on the page.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param page page number to get
#' @param ocr return ocr text of the page (TRUE/FALSE)
#' @param names return the names that appear on the page (TRUE/FALSE)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getpagemetadata(page=1328690, ocr=TRUE, format='json')
#' bhl_getpagemetadata(page=1328690, ocr=TRUE, format='xml')
#' bhl_getpagemetadata(page=1328690, ocr=TRUE, format='xml', output='parsed')
#' }
#' @export
bhl_getpagemetadata <- function(page = NULL, ocr = FALSE, names = FALSE, 
  format = 'json', output = 'list', key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetPageMetadata", apikey = key, pageid=page, 
                       ocr=if(ocr) 't' else NULL, names=if(names) 't' else NULL, 
                       format=format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}