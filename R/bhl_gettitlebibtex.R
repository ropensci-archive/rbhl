#' Return a citation for a title, using the BibTeX format.
#'
#' @export
#' @param titleid the identifier of an individual title (numeric)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_gettitlebibTex(1726)
#' bhl_gettitlebibTex(1726, 'xml')
#' bhl_gettitlebibTex(1726, 'json')
#' }

bhl_gettitlebibTex <- function(titleid = NULL, as = "list", key = NULL, ...)
{
  as <- match.arg(as, c("table","list","json","xml"))
  format <- if(as %in% c('list','json')) 'json' else 'xml'
  args <- compact(list(op = "GetTitleBibTex", apikey = check_key(key), format = format, titleid=titleid))
  bhl_GET(as, args, ...)
}
