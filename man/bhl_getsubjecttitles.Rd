\name{bhl_getsubjecttitles}
\alias{bhl_getsubjecttitles}
\title{Return a list of titles associated with a subject.}
\usage{
bhl_getsubjecttitles(subject = NULL, format = "json", output = "list",
  key = NULL, callopts = list())
}
\arguments{
  \item{subject}{the full or partial subject for which to
  search (character)}

  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a list of titles associated with a subject.
}
\examples{
\dontrun{
bhl_getsubjecttitles('diptera')
bhl_getsubjecttitles('diptera', 'xml', 'raw')
bhl_getsubjecttitles('diptera', 'xml', 'parsed')
}
}

