\name{bhl_namesearch}
\alias{bhl_namesearch}
\title{Search for a particular name.}
\usage{
bhl_namesearch(name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{name}{species name (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Names both with and without NameBank identifiers are
returned.
}
\examples{
\dontrun{
bhl_namesearch('poa annua')
bhl_namesearch(name='helianthus annuus')
}
}

