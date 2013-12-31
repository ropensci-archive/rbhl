\name{bhl_getsubjecttitles}
\alias{bhl_getsubjecttitles}
\title{Return a list of titles associated with a subject.}
\usage{
bhl_getsubjecttitles(subject = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{subject}{the full or partial subject for which to
  search (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a list of titles associated with a subject.
}
\examples{
\dontrun{
bhl_getsubjecttitles('diptera')
}
}

