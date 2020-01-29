check_key <- function(x) {
  tmp <- if (is.null(x)) Sys.getenv("BHL_KEY", "") else x
  if (tmp == "") getOption("bhl_key", stop("need an API key for BHL")) else tmp
}

bhl_GET <- function(as, args, ...){
  cli <- crul::HttpClient$new(url = bhl_url(), opts = list(...))
  out <- cli$get(query = args)
  out$raise_for_status()
  tt <- out$parse("UTF-8")
  res <- switch(as,
         xml = length(xml_children(xml_find_all(read_xml(tt),
                                                "//Result"))),
         json = length(jsonlite::fromJSON(tt)$Result),
         list = length(jsonlite::fromJSON(tt)$Result),
         table = length(jsonlite::fromJSON(tt)$Result))
  if (is.null(res) || res == 0) {
    stop("No results found", call. = FALSE)
  }
  switch(as, json = tt, xml = tt, list = fjson(tt), table = todf(tt))
}

todf <- function(x){
  temp <- jsonlite::fromJSON(I(x), TRUE, flatten = TRUE)$Result
  if (is.character(temp)) {
    temp
  } else {
    tmp <- if (!is.null(names(temp))) {
      data.frame(bhlc(temp), stringsAsFactors = FALSE)
    } else {
      do.call(plyr::rbind.fill, lapply(bhlc(temp), data.frame))
    }
    tibble::as_tibble(tmp)
  }
}

fjson <- function(x) jsonlite::fromJSON(x, FALSE)

bhl_url <- function() "https://www.biodiversitylibrary.org/api3"

bhlc <- function(l) Filter(Negate(is.null), l)

as_f <- function(x) {
  as <- match.arg(x, c("table","list","json","xml"))
  if (as %in% c('list','table','json')) 'json' else 'xml'
}

bool2let <- function(x, y) {
  if (is.null(x)) return(NULL)
  stopifnot(is.logical(x))
  stopifnot(length(y) == 2)
  if (x) y[1] else y[2]
}
