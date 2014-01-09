\name{bhl_gettitleendNote}
\alias{bhl_gettitleendNote}
\title{Return a citation for a title, using the EndNote format.}
\usage{
bhl_gettitleendNote(titleid = NA, key = getOption("BioHerLibKey",
  stop("need an API key for the BHL")), callopts = list())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a citation for a title, using the EndNote format.
}
\examples{
\dontrun{
bhl_gettitleendNote(1726)
}
}

