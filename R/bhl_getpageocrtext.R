#' Return the OCR-generated text of a page.
#'
#' @import httr
#' @importFrom plyr compact
#' @importFrom XML xmlTreeParse
#' @template all
#' @param page page number to get
#' @examples \dontrun{
#' bhl_getpageocrtext(1328690, 'json')
#' bhl_getpageocrtext(1328690, 'xml', 'raw')
#' bhl_getpageocrtext(1328690, 'xml', 'parsed')
#' }
#' @export
bhl_getpageocrtext <- function(page = NULL, format = 'json', output = 'list',
                               key = NULL, ...)
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetPageOcrText", apikey = check_key(key), format=format, pageid=page))
  out <- GET(url, query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
