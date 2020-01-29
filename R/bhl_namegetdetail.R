#' Get basic title, item, and page metadata for each page on which the
#' specified name appears.
#'
#' @export
#' @param namebankid (numeric) (not used if 'name' specified) NameBank
#' identifier for a name
#' @param name (character) (not used if 'namebankid' specified) a
#' complete name string
#' @param id_type (character) the type of identifier (namebank, eol, gni,
#' ion, col, gbif, itis, ipni, worms). Not used if name is specified
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' res <- bhl_namemetadata(name = 'poa annua linnaeus')
#' str(res)
#' # bhl_namemetadata(namebankid = 3501464)
#' }
bhl_namemetadata <- function(namebankid = NULL, name = NULL, id_type = NULL,
  as = 'list', key = NULL, ...) {
  
  args <- bhlc(list(op = "GetNameMetadata", apikey = check_key(key),
    id = namebankid, name = name, idtype = id_type, format = as_f(as)))
  bhl_GET(as, args, ...)
}
