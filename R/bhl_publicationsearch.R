#' Publication search
#' @export
#' @param q (character) the text for which to search
#' @param full_text (character) `TRUE` for a catalog plus full-text search;
#' `FALSE` for a catalog-only search. default: `FALSE`
#' @param page (integer) page to return
#' @inheritParams bhl_getcollections
#' @family publication-search
#' @examples \dontrun{
#' bhl_publicationsearch('cocos island costa rica birds')
#' bhl_publicationsearch('poa annua')
#' bhl_publicationsearch('helianthus annuus')
#' }
bhl_publicationsearch <- function(q = NULL, full_text = FALSE, page = NULL,
  as = "table", key = NULL, ...) {

  args <- bhlc(list(op = "PublicationSearch", searchterm = q,
    searchtype = bool2let(full_text, c('F', 'C')), page = page,
    apikey = check_key(key), format = as_f(as)))
  bhl_GET(as, args, ...)
}

#' Publication search advanced 
#' @export
#' @param title (character) a title for which to search
#' @param titleop (character) 'all' to search for all specified words in the
#' title fields; 'phrase' to search for the exact phrase specified
#' @param authorname (character) an author name for which to search
#' @param year (integer) a four-digit publication year for which to search
#' @param subject (character) a subject for which to search
#' @param language (character) a language code; search will only return
#' publications in the specified language
#' @param collection (character) a collection id; search will only return
#' publications from the specfied collection
#' @param notes (character) one or more words for which to search in the
#' publication notes
#' @param notesop (character) 'all' to search for all specified words in the
#' notes field; 'phrase' to search for the exact phrase specified
#' @param text (character) one or more words for which to search in the text
#' of the publications
#' @param textop (character) 'all' to search for all specified words in the
#' text field; 'phrase' to search for the exact phrase specified
#' @param page (integer) 1 for the first page of results, 2 for the second,
#' and so on
#' @inheritParams bhl_getcollections
#' @family publication-search
#' @examples \dontrun{
#' bhl_publicationsearchadv(title = "cocos island", titleop = "all",
#'   authorname = "gifford", year = 1919)
#' bhl_publicationsearchadv(title = "cocos island", authorname = "gifford")
#' }
bhl_publicationsearchadv <- function(title = NULL, titleop = NULL,
  authorname = NULL, year = NULL, subject = NULL, language = NULL,
  collection = NULL, notes = NULL, notesop = NULL, text = NULL, textop = NULL,
  page = NULL, as = "table", key = NULL, ...) {

  args <- bhlc(list(op = "PublicationSearchAdvanced", title = title,
    titleop = titleop, authorname = authorname, year = year, subject = subject,
    language = language, collection = collection, notes = notes,
    notesop = notesop, text = text, textop = textop, page = page,
    apikey = check_key(key), format = as_f(as)))
  bhl_GET(as, args, ...)
}
