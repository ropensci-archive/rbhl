\name{bhl_getitembyidentifier}
\alias{bhl_getitembyidentifier}
\title{Find and return metadata about an item or items that match a specific identifier.}
\usage{
bhl_getitembyidentifier(type = NULL, value = NULL, format = "json",
  output = "list", key = NULL, callopts = list())
}
\arguments{
  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{type}{the type of identifier (barcode or ia)
  (character)}

  \item{value}{the identifier value (character)}
}
\description{
If you know the Internet Archive identifier for an item,
use this method to look up the equivalent item in BHL.
}
\examples{
\dontrun{
bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi')
bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml', output='raw')
bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml', output='parsed')
}
}

