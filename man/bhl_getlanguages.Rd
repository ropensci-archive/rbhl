\name{bhl_getlanguages}
\alias{bhl_getlanguages}
\title{Get a list of languages in which materials in BHL have been written.}
\usage{
bhl_getlanguages(pretty = FALSE, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{pretty}{print pretty, as data.frame (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Get a list of languages in which materials in BHL have been
written.
}
\examples{
\dontrun{
bhl_getlanguages()
bhl_getlanguages(pretty = T)
}
}

