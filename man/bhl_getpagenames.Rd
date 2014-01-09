\name{bhl_getpagenames}
\alias{bhl_getpagenames}
\title{Return a list of names that appear on a page.}
\usage{
bhl_getpagenames(page = NULL, format = "json", output = "list",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list())
}
\arguments{
  \item{page}{page number to get}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a list of names that appear on a page.
}
\examples{
\dontrun{
bhl_getpagenames('1328690')
bhl_getpagenames('1328690', 'xml', 'raw')
bhl_getpagenames('1328690', 'xml', 'parsed')
}
}

