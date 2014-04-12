\name{bhl_getitemmetadata}
\alias{bhl_getitemmetadata}
\title{Return metadata about an item.}
\usage{
bhl_getitemmetadata(itemid = NULL, pages = TRUE, ocr = FALSE,
  format = "json", output = "list", key = NULL, callopts = list())
}
\arguments{
  \item{itemid}{item id (character)}

  \item{pages}{return the items pages (logical)}

  \item{ocr}{return ocr text of the page (logical)}

  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
You may choose to include a list of the item's pages.
}
\examples{
\dontrun{
bhl_getitemmetadata('16800', TRUE)
bhl_getitemmetadata('16800', TRUE, 'xml', 'parsed')
bhl_getitemmetadata('16800', TRUE, 'json', 'raw')
bhl_getitemmetadata('16800', TRUE, 'xml', 'raw')
}
}

