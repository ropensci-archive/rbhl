\name{bioherlib}
\alias{bioherlib}
\title{Search BHL across many API methods.}
\usage{
  bioherlib(method = list("GetPageMetadata", "GetPageOcrText", "GetPageNames", "GetItemMetadata", "GetItemByIdentifier", "GetItemPages", "GetUnpublishedItems", "GetTitleMetadata", "GetTitleItems", "GetTitleByIdentifier", "TitleSearchSimple", "GetTitleBibTex", "GetTitleEndNote", "GetUnpublishedTitles", "SubjectSearch", "GetSubjectTitles", "AuthorSearch", "GetAuthorTitles", "NameCount", "NameList", "NameGetDetail", "NameSearch", "GetCollections", "GetLanguages"),
    page = NA, ocrtext = FALSE, names = FALSE, format = NA,
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{ocrtext}{return ocr text of the page (TRUE/FALSE)}

  \item{names}{return the names that appear on the page
  (TRUE/FALSE)}

  \item{method}{The API method to use.}

  \item{page}{The identifier of an individual page in a
  scanned book.}

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
  Search BHL across many API methods.
}
\examples{
\dontrun{
bioherlib(method='GetPageMetadata', page='1328690', ocrtext=TRUE, names=TRUE, format='json')
bioherlib('GetPageNames', '1328690', 'TRUE', 'TRUE', 'json')
}
}

