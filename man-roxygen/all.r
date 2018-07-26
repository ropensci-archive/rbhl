#' @param format either XML ('xml') or JSON ('json') format. If output='list',
#' 		format is forced to equal 'json'
#' @param key Your BHL API key, either enter, or loads from your \code{.Renviron} 
#' as \code{BHL_KEY} or from \code{.Rprofile} as \code{bhl_key}.
#' @param ... Curl options passed on to \code{\link[crul]{HttpClient}}
#' @param output Return a list, raw json or xml, or parsed data (character).
#'    Default: 'list'
