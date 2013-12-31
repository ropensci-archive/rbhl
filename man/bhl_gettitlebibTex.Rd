\name{bhl_gettitlebibTex}
\alias{bhl_gettitlebibTex}
\title{Return a citation for a title, using the BibTeX format.}
\usage{
bhl_gettitlebibTex(titleid = NA, justresult = FALSE, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{justresult}{just print result? (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
Return a citation for a title, using the BibTeX format.
}
\examples{
\dontrun{
bhl_gettitlebibTex('1726')
bhl_gettitlebibTex('1726', TRUE)
}
}

