\name{getlanguages}
\alias{getlanguages}
\title{Get a list of languages in which materials in BHL have been written.}
\usage{
  getlanguages(pretty = FALSE, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{pretty}{print pretty, as data.frame (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{url}{the BHL API url for the function (should be
  left to default)}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\description{
  Get a list of languages in which materials in BHL have
  been written.
}
\examples{
\dontrun{
getlanguages()
getlanguages(pretty = T)
}
}

