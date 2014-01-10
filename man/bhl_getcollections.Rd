\name{bhl_getcollections}
\alias{bhl_getcollections}
\title{Get a list of collections which are used to group titles and items. A single
   collection may contain either titles or items, but not both.}
\usage{
bhl_getcollections(format = "json", output = "list",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list())
}
\arguments{
  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Get a list of collections which are used to group titles
and items. A single collection may contain either titles or
items, but not both.
}
\examples{
\dontrun{
bhl_getcollections()
bhl_getcollections(out = 'raw')
}
}

