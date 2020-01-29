#' Search an item for pages containing the specified text
#' @export
#' @param id (integer) BHL identifier of the item to be searched
#' @param text (character) the text for which to search
#' @inheritParams bhl_getcollections
#' @examples \dontrun{
#' bhl_pagesearch(22004, "dog")
#' bhl_pagesearch(22004, "dog", as = "json")
#' }
bhl_pagesearch <- function(id, text, as = "table", key = NULL, ...) {
  args <- bhlc(list(op = "PageSearch", apikey = check_key(key),
                    format = as_f(as), itemid = id, text = text))
  bhl_GET(as, args, ...)
}
