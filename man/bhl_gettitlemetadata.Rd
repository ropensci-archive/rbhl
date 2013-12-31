\name{bhl_gettitlemetadata}
\alias{bhl_gettitlemetadata}
\title{Return metadata about a title. You may choose to include a list of
   the items (books) associated  with the title.}
\usage{
bhl_gettitlemetadata(titleid = NA, items = FALSE, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{items}{logical}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return metadata about a title. You may choose to include a
list of the items (books) associated with the title.
}
\examples{
\dontrun{
bhl_gettitlemetadata(1726, TRUE)
}
}

