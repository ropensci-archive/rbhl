\name{gettitleendNote}
\alias{gettitleendNote}
\title{Return a citation for a title, using the EndNote format.}
\usage{
  gettitleendNote(titleid = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

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
  Return a citation for a title, using the EndNote format.
}
\examples{
\dontrun{
gettitleendNote('1726')
}
}

