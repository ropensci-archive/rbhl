\name{bhl_subjectsearch}
\alias{bhl_subjectsearch}
\title{Return a list of subjects that match (fully or partially) the specified
   search string.}
\usage{
bhl_subjectsearch(subject = NA, format = "json", key = NULL,
  output = "list", callopts = list())
}
\arguments{
  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{subject}{the full or partial subject for which to
  search (character)}
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

