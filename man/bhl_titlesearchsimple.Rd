\name{bhl_titlesearchsimple}
\alias{bhl_titlesearchsimple}
\title{Perform a simple title search.}
\usage{
bhl_titlesearchsimple(title = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{title}{full or partial title for which to search
  (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
The full title (as specified in MARC 245a and MARC 245b
library records) is searched for the specified string.
Basic metadata for all full and partial matches is
returned.
}
\examples{
\dontrun{
bhl_titlesearchsimple('nematocerous')
bhl_titlesearchsimple('husbandry')
}
}

