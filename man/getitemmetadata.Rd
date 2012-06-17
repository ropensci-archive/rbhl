\name{getitemmetadata}
\alias{getitemmetadata}
\title{Return metadata about an item.}
\usage{
  getitemmetadata(itemid = NA, format = NA, pages = TRUE,
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{itemid}{item id (character)}

  \item{pages}{return the items pages (TRUE/FALSE)}

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
  You may choose to include a list of the item's pages.
}
\examples{
\dontrun{
getitemmetadata('16800', 'json', TRUE)
}
}

