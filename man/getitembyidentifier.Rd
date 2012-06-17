\name{getitembyidentifier}
\alias{getitembyidentifier}
\title{Find and return metadata about an item or items that match a specific identifier.}
\usage{
  getitembyidentifier(type = NA, value = NA, format = NA,
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{type}{the type of identifier (barcode or ia)
  (character)}

  \item{value}{the identifier value (character)}

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
  If you know the Internet Archive identifier for an item,
  use this method to look up the equivalent item in BHL.
}
\examples{
\dontrun{
getitembyidentifier('ia', 'animalkingdomarr03cuvi', 'json')
}
}

