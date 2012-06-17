\name{gettitlebyidentifier}
\alias{gettitlebyidentifier}
\title{Find and return metadata about a title or titles that match a specific identifier.}
\usage{
  gettitlebyidentifier(type = NA, value, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{type}{the type of identifier (oclc, issn, isbn,
  lccn, ddc, nal, nlm, coden) character}

  \item{value}{the identifier value (numeric)}

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
  Find and return metadata about a title or titles that
  match a specific identifier.
}
\examples{
\dontrun{
gettitlebyidentifier('oclc', 2992225)
}
}

