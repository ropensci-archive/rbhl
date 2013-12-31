\name{bhl_getpagemetadata}
\alias{bhl_getpagemetadata}
\title{Return metadata about a page.}
\usage{
bhl_getpagemetadata(page = NA, ocrtext = FALSE, names = FALSE,
  format = NA,
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
  key = getOption("BioHerLibKey",
  stop("need an API key for the Biod Her Library")), ...,
  curl = getCurlHandle())
}
\arguments{
  \item{page}{page number to get}

  \item{ocrtext}{return ocr text of the page (TRUE/FALSE)}

  \item{names}{return the names that appear on the page
  (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}
}
\description{
You may choose to include the OCR text and a list of names
found on the page.
}
\examples{
\dontrun{
bhl_getpagemetadata('1328690', FALSE, FALSE, 'json')
}
}

