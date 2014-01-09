\name{bhl_gettitleitems}
\alias{bhl_gettitleitems}
\title{Return a list of a title's items (books).}
\usage{
bhl_gettitleitems(titleid = NULL, format = "json", output = "list",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a list of a title's items (books).
}
\examples{
\dontrun{
bhl_gettitleitems(1726)
bhl_gettitleitems(1726, output='raw')
bhl_gettitleitems(1726, format='xml', output='raw')
bhl_gettitleitems(1726, format='xml', output='parsed')
}
}

