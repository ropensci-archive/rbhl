#' Get a list of collections which are used to group titles and items. A single
#' collection may contain either titles or items, but not both.
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @importFrom plyr ldply rbind.fill
#'
#' @export
#' @param as (character) Return a list, json xml, or parsed table (default)
#' @param key Your BHL API key, either enter, or loads from your \code{.Renviron} as \code{BHL_KEY}
#' or from \code{.Rprofile} as \code{bhl_key}.
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#'
#' @examples \dontrun{
#' bhl_getcollections()
#' bhl_getcollections(as = 'list')
#' bhl_getcollections(as = 'json')
#' bhl_getcollections(as = 'xml')
#' }

bhl_getcollections <- function(as='table', key = NULL, ...)
{
  format <- if(as %in% c('list','table','json')) 'json' else 'xml'
  args <- bhlc(list(op = "GetCollections", apikey = check_key(key), format = format))
  bhl_GET(as, args, ...)
}
