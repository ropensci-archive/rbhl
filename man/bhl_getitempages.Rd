\name{bhl_getitempages}
\alias{bhl_getitempages}
\title{Return a list of an item's pages.}
\usage{
bhl_getitempages(itemid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{itemid}{the item id (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a list of an item's pages.
}
\examples{
\dontrun{
bhl_getitempages('16800')
}
}

