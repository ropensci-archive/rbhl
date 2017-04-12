check_key <- function(x) {
  tmp <- if (is.null(x)) Sys.getenv("BHL_KEY", "") else x
  if (tmp == "") getOption("bhl_key", stop("need an API key for BHL")) else tmp
}

bhl_GET <- function(as, args, ...){
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  res <- switch(as,
         xml = length(xml_children(xml_find_all(read_xml(content_utf8(out)),
                                                "//Result"))),
         json = length(jsonlite::fromJSON(content_utf8(out))$Result),
         list = length(jsonlite::fromJSON(content_utf8(out))$Result),
         table = length(jsonlite::fromJSON(content_utf8(out))$Result))
  if (is.null(res) || res == 0) {
    stop("No results found", call. = FALSE)
  }
  tt <- content_utf8(out)
  switch(as, json = tt, xml = tt, list = fjson(tt), table = todf(tt))
}

content_utf8 <- function(x) content(x, as = "text", encoding = "UTF-8")

todf <- function(x){
  temp <- jsonlite::fromJSON(I(x), TRUE, flatten = TRUE)$Result
  if (is.character(temp)) {
    temp
  } else {
    tmp <- if (!is.null(names(temp))) {
      data.frame(bhlc(temp), stringsAsFactors = FALSE)
    } else {
      do.call(rbind.fill, lapply(bhlc(temp), data.frame))
    }
    tibble::as_data_frame(tmp)
  }
}

fjson <- function(x) jsonlite::fromJSON(x, FALSE)

bhl_url <- function() "http://www.biodiversitylibrary.org/api2/httpquery.ashx"

bhlc <- function(l) Filter(Negate(is.null), l)

as_f <- function(x) {
  as <- match.arg(x, c("table","list","json","xml"))
  if (as %in% c('list','table','json')) 'json' else 'xml'
}
