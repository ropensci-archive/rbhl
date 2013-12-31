\name{bhl_gettitleendNote}
\alias{bhl_gettitleendNote}
\title{Return a citation for a title, using the EndNote format.}
\usage{
bhl_gettitleendNote(titleid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a citation for a title, using the EndNote format.
}
\examples{
\dontrun{
bhl_gettitleendNote('1726')
}
}

