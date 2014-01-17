\name{bhl_titlesearchsimple}
\alias{bhl_titlesearchsimple}
\title{Perform a simple title search.}
\usage{
bhl_titlesearchsimple(title = NA, format = "json", key = NULL,
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

  \item{title}{full or partial title for which to search
  (character)}
}
\description{
The full title (as specified in MARC 245a and MARC 245b
library records) is searched for the specified string.
Basic metadata for all full and partial matches is
returned.
}
\examples{
\dontrun{
bhl_titlesearchsimple('nematocerous')
bhl_titlesearchsimple('husbandry')
}
}

