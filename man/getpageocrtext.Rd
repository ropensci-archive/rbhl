\name{getpageocrtext}
\alias{getpageocrtext}
\title{Return the OCR-generated text of a page.}
\usage{
  getpageocrtext(page = NA, ocrtext = FALSE, names = FALSE,
    format = NA,
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{page}{page number to get}

  \item{ocrtext}{return ocr text of the page (TRUE/FALSE)}

  \item{names}{return the names that appear on the page
  (TRUE/FALSE)}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{url}{the BHL API url for the function (should be
  left to default)}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\description{
  Return the OCR-generated text of a page.
}
\examples{
\dontrun{
getpageocrtext('1328690', FALSE, FALSE, 'json')
}
}

