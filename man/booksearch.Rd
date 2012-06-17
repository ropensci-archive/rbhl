\name{booksearch}
\alias{booksearch}
\title{Search for titles and items in BHL.}
\usage{
  booksearch(title = NA, lname = NA, volume = NA,
    edition = NA, year = NA, collectionid = NA,
    language = NA, format = "json",
    url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{title}{string to search for in the title
  (character)}

  \item{lname}{last name to search for (character)}

  \item{volume}{volume to search for (numeric)}

  \item{edition}{edition to search for (character)}

  \item{year}{year to search for, four characters, e.g,
  1970 (numeric)}

  \item{collectionid}{collection identifier to search for
  (numeric)}

  \item{language}{language to search for (character)}

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
  Search criteria includes title, author last name, volume,
  edition, year of publication, subject, language code, and
  collection identifier. Valid language codes and
  collection identifiers can be obtained from the
  getlanguages and getcollections functions. If year of
  publication is specified, it should be a 4-digit year. To
  execute a search, you must supply at least a title,
  author last name, or collection identifier.
}
\examples{
\dontrun{
booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825, collectionid=4, language='eng')
out <- booksearch('evolution')
# Note  --Use getcollections() or getlanguages() to get acceptable terms
}
}
\seealso{
  \code{\link{getcollections}, \link{getlanguages}}
}

