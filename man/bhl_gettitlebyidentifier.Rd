\name{bhl_gettitlebyidentifier}
\alias{bhl_gettitlebyidentifier}
\title{Find and return metadata about a title or titles that match a specific identifier.}
\usage{
bhl_gettitlebyidentifier(type = NA, value, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{type}{the type of identifier (oclc, issn, isbn,
  lccn, ddc, nal, nlm, coden) character}

  \item{value}{the identifier value (numeric)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Find and return metadata about a title or titles that match
a specific identifier.
}
\examples{
\dontrun{
bhl_gettitlebyidentifier('oclc', 2992225)
}
}

