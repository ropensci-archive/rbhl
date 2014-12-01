#' Return the OCR-generated text of a page.
#'
#' @export
#' @param page page number to get
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getpageocrtext(1328690)
#' bhl_getpageocrtext(1328690, 'json')
#' bhl_getpageocrtext(1328690, 'xml')
#' }

bhl_getpageocrtext <- function(page = NULL, as = 'table', key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetPageOcrText", apikey = check_key(key), format=format, pageid=page))
  bhl_GET(as, args, ...)
}
