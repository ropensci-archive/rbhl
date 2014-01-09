\name{bhl_gettitlebibTex}
\alias{bhl_gettitlebibTex}
\title{Return a citation for a title, using the BibTeX format.}
\usage{
bhl_gettitlebibTex(titleid = NULL, format = "json", output = "list",
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")),
  callopts = list())
}
\arguments{
  \item{titleid}{the identifier of an individual title
  (numeric)}

  \item{justresult}{just print result? (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
Return a citation for a title, using the BibTeX format.
}
\examples{
\dontrun{
bhl_gettitlebibTex(1726)
bhl_gettitlebibTex(1726, output='raw')
bhl_gettitlebibTex(1726, format='xml', output='raw')
bhl_gettitlebibTex(1726, format='xml', output='parsed')
}
}

