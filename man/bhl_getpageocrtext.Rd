\name{bhl_getpageocrtext}
\alias{bhl_getpageocrtext}
\title{Return the OCR-generated text of a page.}
\usage{
bhl_getpageocrtext(page = NULL, ocr = FALSE, names = FALSE,
  format = "json", output = "list", key = NULL, callopts = list())
}
\arguments{
  \item{page}{page number to get}

  \item{ocr}{return ocr text of the page (TRUE/FALSE)}

  \item{names}{return the names that appear on the page
  (TRUE/FALSE)}

  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return the OCR-generated text of a page.
}
\examples{
\dontrun{
bhl_getpageocrtext(1328690, FALSE, FALSE, 'json')
bhl_getpageocrtext(1328690, FALSE, FALSE, 'xml', 'raw')
bhl_getpageocrtext(1328690, FALSE, FALSE, 'xml', 'parsed')
}
}

