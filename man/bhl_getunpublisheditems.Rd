\name{bhl_getunpublisheditems}
\alias{bhl_getunpublisheditems}
\title{Return a list of the identifiers of all unpublished items.}
\usage{
bhl_getunpublisheditems(format = "json",
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
Return a list of the identifiers of all unpublished items.
}
\examples{
\dontrun{
bhl_getunpublisheditems()
}
}

