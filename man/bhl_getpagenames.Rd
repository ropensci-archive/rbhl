\name{bhl_getpagenames}
\alias{bhl_getpagenames}
\title{Return a list of names that appear on a page.}
\usage{
bhl_getpagenames(page = NA, format = NA,
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{page}{page number to get}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a list of names that appear on a page.
}
\examples{
\dontrun{
bhl_getpagenames('1328690', 'json')
}
}

