\name{bhl_getunpublishedtitles}
\alias{bhl_getunpublishedtitles}
\title{Return a list of the identifiers of all unpublished titles.}
\usage{
bhl_getunpublishedtitles(format = "json", output = "list",
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
Return a list of the identifiers of all unpublished titles.
}
\examples{
\dontrun{
bhl_getunpublishedtitles()
bhl_getunpublishedtitles(output='raw')
bhl_getunpublishedtitles(format='xml', output='raw')
bhl_getunpublishedtitles(format='xml', output='parsed')
}
}

