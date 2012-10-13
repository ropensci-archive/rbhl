\name{titlesearchsimple}
\alias{titlesearchsimple}
\title{Perform a simple title search.}
\usage{
  titlesearchsimple(title = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{title}{full or partial title for which to search
  (character)}

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
  The full title (as specified in MARC 245a and MARC 245b
  library records) is searched for the specified string.
  Basic metadata for all full and partial matches is
  returned.
}
\examples{
\dontrun{
titlesearchsimple('nematocerous')
titlesearchsimple('husbandry')
}
}

