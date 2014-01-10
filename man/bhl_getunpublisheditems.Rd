\name{bhl_getunpublisheditems}
\alias{bhl_getunpublisheditems}
\title{Return a list of the identifiers of all unpublished items.}
\usage{
bhl_getunpublisheditems(format = "json", output = "list",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list())
}
\arguments{
  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a list of the identifiers of all unpublished items.
}
\examples{
\dontrun{
bhl_getunpublisheditems()
bhl_getunpublisheditems(output='raw')
bhl_getunpublisheditems(format='xml', output='raw')
bhl_getunpublisheditems(format='xml', output='parsed')
}
}

