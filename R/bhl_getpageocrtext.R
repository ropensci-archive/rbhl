#' Return the OCR-generated text of a page.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @param page page number to get
#' @param ocr return ocr text of the page (TRUE/FALSE)
#' @param names return the names that appear on the page (TRUE/FALSE)
#' @inheritParams bhl_authorsearch
#' @examples \dontrun{
#' bhl_getpageocrtext(1328690, FALSE, FALSE, 'json')
#' bhl_getpageocrtext(1328690, FALSE, FALSE, 'xml', 'raw')
#' bhl_getpageocrtext(1328690, FALSE, FALSE, 'xml', 'parsed')
#' }
#' @export
bhl_getpageocrtext <- function(page = NULL, ocr = FALSE, names = FALSE, format = 'json', 
  output = 'list', key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts = list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetPageOcrText", apikey = key, format=format, pageid=page,
                       ocr=if(ocr) 't' else NULL, names=if(names) 't' else NULL))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
} 