\name{bhl_gettitlemetadata}
\alias{bhl_gettitlemetadata}
\title{Return metadata about a title. You may choose to include a list of
   the items (books) associated  with the title.}
\usage{
bhl_gettitlemetadata(titleid = NA, items = FALSE, format = "json",
  output = "list", key = getOption("BioHerLibKey",
  stop("need an API key for the BHL")), callopts = list())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{items}{(logical) TRUE of FALSE (default) to inclue
  items}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return metadata about a title. You may choose to include a
list of the items (books) associated with the title.
}
\examples{
\dontrun{
bhl_gettitlemetadata(1726, TRUE)
bhl_gettitlemetadata(1726, output='raw')
bhl_gettitlemetadata(1726, format='xml', output='raw')
bhl_gettitlemetadata(1726, format='xml', output='parsed')
}
}

