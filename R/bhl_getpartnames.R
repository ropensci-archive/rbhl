#' Return a list of scientific names associated with a part.
#'
#' @export
#' @param partid The identifier of an individual part (article, chapter, etc) (character)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getpartnames(7443, "xml")
#' bhl_getpartnames(7443, "json")
#' bhl_getpartnames(7443, "list")
#' }

bhl_getpartnames <- function(partid, as = "table", key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetPartNames", apikey = check_key(key), format = format,
                       partid=partid))
  bhl_GET(as, args, ...)
}
