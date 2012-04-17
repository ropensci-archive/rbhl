\name{namegetdetail}
\alias{namegetdetail}
\title{namegetdetail}
\usage{
  namegetdetail(namebankid = NA, name = NA,
    format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{namebankid}{(not used if 'name' specified) NameBank
  identifier for a name (numeric)}

  \item{name}{(not used if 'namebankid' specified) a
  complete name string (character)}

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
  namegetdetail
}
\examples{
\dontrun{
namegetdetail(namebankid = 3501464)
namegetdetail(name = 'poa annua supina')
}
}

