\name{bhl_getunpublishedparts}
\alias{bhl_getunpublishedparts}
\title{Return a list of the identifiers of all unpublished parts (articles, chapters, etc).}
\usage{
bhl_getunpublishedparts(format = "json", output = "list", key = NULL,
  callopts = list())
}
\arguments{
  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}
}
\description{
Return a list of the identifiers of all unpublished parts
(articles, chapters, etc).
}
\examples{
\dontrun{
bhl_getunpublishedparts()
bhl_getunpublishedparts(output='raw')
bhl_getunpublishedparts(format='xml', output='raw')
bhl_getunpublishedparts(format='xml', output='parsed')
}
}

