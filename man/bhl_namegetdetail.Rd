\name{bhl_namegetdetail}
\alias{bhl_namegetdetail}
\title{Get basic title, item, and page metadata for each page on which the specified name appears.}
\usage{
bhl_namegetdetail(namebankid = NA, name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{namebankid}{(not used if 'name' specified) NameBank
  identifier for a name (numeric)}

  \item{name}{(not used if 'namebankid' specified) a
  complete name string (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Get basic title, item, and page metadata for each page on
which the specified name appears.
}
\examples{
\dontrun{
bhl_namegetdetail(namebankid = 3501464)
bhl_namegetdetail(name = 'poa annua supina')
}
}

