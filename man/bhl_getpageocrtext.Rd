\name{bhl_getpageocrtext}
\alias{bhl_getpageocrtext}
\title{Return the OCR-generated text of a page.}
\usage{
bhl_getpageocrtext(page = NA, ocrtext = FALSE, names = FALSE,
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
Return the OCR-generated text of a page.
}
\examples{
\dontrun{
bhl_getpageocrtext('1328690', FALSE, FALSE, 'json')
}
}

