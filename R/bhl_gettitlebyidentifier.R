#' Find and return metadata about a title or titles that match a specific identifier.
#'
#' @export
#' @param type the type of identifier (oclc, issn, isbn, lccn, ddc, nal, nlm, coden) character
#' @param value the identifier value (numeric)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_gettitlebyidentifier('oclc', 2992225)
#' bhl_gettitlebyidentifier('oclc', 2992225, 'json')
#' bhl_gettitlebyidentifier('oclc', 2992225, 'xml')
#' }

bhl_gettitlebyidentifier <- function(type=NULL, value=NULL, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetTitleByIdentifier", apikey = check_key(key), format = format,
                       type=type, value=value))
  bhl_GET(as, args, ...)
}
