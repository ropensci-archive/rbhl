\name{getauthortitles}
\alias{getauthortitles}
\title{Return a list of titles associated with a given BHL author identifier.}
\usage{
  getauthortitles(creatorid = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{creatorid}{BHL identifier for a particular author
  (numeric)}

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
  Unless the identifier for a particular BHL author record
  is known in advance, this method should be used in
  combination with the AuthorSearch method.
}
\examples{
\dontrun{
getauthortitles(1970)
}
}

