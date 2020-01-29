#' Get metadata about a subject
#' @export
#' @param subject (character) he subject for which to return metadata
#' @param pubs (logical) `TRUE` to return the subject's publications.
#' Default: `FALSE`
#' @inheritParams bhl_getcollections
#' @details You may choose to include a list of the subject's publications.
#' The BHLType element identifies the type of each publication (Title or Part).
#' @examples \dontrun{
#' bhl_subjectmetadata(subject = "water")
#' x <- bhl_subjectmetadata(subject = "water", pubs = TRUE)
#' head(x$Publications[[1]])
#' }
bhl_subjectmetadata <- function(subject, pubs = FALSE, as = "table",
  key = NULL, ...) {

  args <- bhlc(list(op = "GetSubjectMetadata", subject = subject,
    pubs = if (pubs) "t" else NULL, apikey = check_key(key),
    format = as_f(as)))
  bhl_GET(as, args, ...)
}
