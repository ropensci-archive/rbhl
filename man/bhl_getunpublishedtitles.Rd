\name{bhl_getunpublishedtitles}
\alias{bhl_getunpublishedtitles}
\title{Return a list of the identifiers of all unpublished titles.}
\usage{
bhl_getunpublishedtitles(format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a list of the identifiers of all unpublished titles.
}
\examples{
\dontrun{
bhl_getunpublishedtitles()
}
}

