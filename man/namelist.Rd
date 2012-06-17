\name{namelist}
\alias{namelist}
\title{List the unique names.}
\usage{
  namelist(startrow = NA, batchsize = NA, startdate = NA,
    enddate = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{startrow}{first name to return (if using as an
  offset)}

  \item{batchsize}{number of names to return (numeric)}

  \item{startdate}{(optional) start date of range between
  which to count names (date)}

  \item{enddate}{(optional) end date of range between which
  to count names (date)}

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
  By using the startrow and batchsize parameters
  appropriately, you can pull the list all at once, or in
  batches (i.e. 1000 names at a time).  Names both with and
  without NameBank identifiers are returned.
}
\examples{
\dontrun{
namelist(1, 1000, '10/15/2009', '10/31/2009')
}
}

