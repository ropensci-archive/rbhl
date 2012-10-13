\name{authorsearch}
\alias{authorsearch}
\title{Return a list of authors that match (fully or partially) the specified
   search string.}
\usage{
  authorsearch(name = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{name}{full or partial name of the author for which
  to search (last name listed first, i.e. 'Darwin,
  Charles') (character)}

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
  The namessearched are those contained in MARC 100a, 110a,
  111a, 700a, 710a, and 711a library records.
}
\examples{
\dontrun{
authorsearch(name='dimmock')
}
}

