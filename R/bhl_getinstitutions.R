#' GetInstitutions data
#'
#' @export
#' @inheritParams bhl_getcollections
#' @details Get a list of institutions which have contributed to BHL in some
#' way. These institutions may fill roles such as contributors, rights
#' holders, and scanning institutions.
#' @examples \dontrun{
#' bhl_getinstitutions()
#' }
bhl_getinstitutions <- function(as = 'table', key = NULL, ...) {
  args <- bhlc(list(op = "GetInstitutions", apikey = check_key(key),
                    format = as_f(as)))
  bhl_GET(as, args, ...)
}
