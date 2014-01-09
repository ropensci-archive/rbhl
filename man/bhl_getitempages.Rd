\name{bhl_getitempages}
\alias{bhl_getitempages}
\title{Return a list of an item's pages.}
\usage{
bhl_getitempages(itemid = NA, format = "json", output = "list",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list())
}
\arguments{
  \item{itemid}{the item id (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a list of an item's pages.
}
\examples{
\dontrun{
bhl_getitempages('16800')
bhl_getitempages('16800', 'xml', 'raw')
bhl_getitempages('16800', 'xml', 'parsed')
}
}

