\name{getcollections}
\alias{getcollections}
\title{Get a list of collections which are used to group titles and items. A single
   collection may contain either titles or items, but not both.}
\usage{
  getcollections(pretty = FALSE, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{pretty}{Print pretty as a data.frame (TRUE/FALSE).}

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
  Get a list of collections which are used to group titles
  and items. A single collection may contain either titles
  or items, but not both.
}
\examples{
\dontrun{
getcollections()
getcollections(pretty = T)
}
}

