\name{bhl_gettitleitems}
\alias{bhl_gettitleitems}
\title{Return a list of a title's items (books).}
\usage{
bhl_gettitleitems(titleid = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a list of a title's items (books).
}
\examples{
\dontrun{
bhl_gettitleitems(1726)
}
}

