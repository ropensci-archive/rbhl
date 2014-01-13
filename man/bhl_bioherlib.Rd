\name{bhl_bioherlib}
\alias{bhl_bioherlib}
\title{Search BHL across many API methods.}
\usage{
bhl_bioherlib(method = "GetPageMetadata", pageid = NULL, ocr = FALSE,
  names = FALSE, format = "json", key = NULL, output = "list",
  callopts = list())
}
\arguments{
  \item{method}{The API method to use.}

  \item{pageid}{The identifier of an individual page in a
  scanned book.}

  \item{ocr}{return ocr text of the page (logical).
  Default: FALSE}

  \item{names}{return the names that appear on the page
  (logical). Default: FALSE}

  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Search BHL across many API methods.
}
\examples{
\dontrun{
bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE)
bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, format="xml")
bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, raw=TRUE)
}
}

