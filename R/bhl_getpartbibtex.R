#' Return a citation for a part, using the BibTeX format.
#'
#' @export
#' @param partid The identifier of an individual part (article, chapter, etc) (numeric)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getpartbibtex(1000)
#' bhl_getpartbibtex(1000, 'xml')
#' bhl_getpartbibtex(1000, 'json')
#' }

bhl_getpartbibtex <- function(partid, as = "list", key = NULL, ...)
{
  as <- match.arg(as, c("table","list","json","xml"))
  format <- if(as %in% c('list','json')) 'json' else 'xml'
  args <- compact(list(op = "GetPartBibTex", apikey = check_key(key), format = format, partid=partid))
  bhl_GET(as, args, ...)
}
