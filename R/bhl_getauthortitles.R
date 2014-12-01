#' Return a list of titles associated with a given BHL author identifier.
#'
#' Unless the identifier  for a particular BHL author record is known in
#'    advance, this method should be used in combination	with the AuthorSearch
#'    method.
#'
#' @export
#' @param creatorid BHL identifier for a particular author (numeric)
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_getauthortitles(1970)
#' bhl_getauthortitles(1970, as='json')
#' bhl_getauthortitles(1970, as='xml')
#' bhl_getauthortitles(1970, as='list')
#' }
bhl_getauthortitles <- function(creatorid, as='table', key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetAuthorTitles", apikey = check_key(key), format = format,
                       creatorid=creatorid))
  bhl_GET(as, args, ...)
}
