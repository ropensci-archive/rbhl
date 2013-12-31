\name{bhl_getitemmetadata}
\alias{bhl_getitemmetadata}
\title{Return metadata about an item.}
\usage{
bhl_getitemmetadata(itemid = NA, format = NA, pages = TRUE,
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{itemid}{item id (character)}

  \item{pages}{return the items pages (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
You may choose to include a list of the item's pages.
}
\examples{
\dontrun{
bhl_getitemmetadata('16800', 'json', TRUE)
}
}

