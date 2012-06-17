\name{namecount}
\alias{namecount}
\title{Return the number of unique names found on pages in BHL.}
\usage{
  namecount(startdate = NA, enddate = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{startdate}{start date of range between which to
  count names (optional)}

  \item{enddate}{end date of range between which to count
  names (optional)}

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
  Names both with and without NameBank identifiers are
  counted.
}
\examples{
\dontrun{
namecount(startdate = '10/15/2009', enddate = '10/17/2009')
}
}

