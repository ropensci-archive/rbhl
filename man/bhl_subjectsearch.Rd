\name{bhl_subjectsearch}
\alias{bhl_subjectsearch}
\title{Return a list of subjects that match (fully or partially) the specified
   search string.}
\usage{
bhl_subjectsearch(subject = NA, format = "json",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  output = "list", callopts = list())
}
\arguments{
  \item{subject}{the full or partial subject for which to
  search (character)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a list of subjects that match (fully or partially)
the specified search string.
}
\examples{
\dontrun{
bhl_subjectsearch('diptera')
}
}

