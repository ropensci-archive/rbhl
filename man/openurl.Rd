\name{openurl}
\alias{openurl}
\title{Not sure how this differs from their other API...}
\usage{
  openurl(genre = NULL, title = NULL, aufirst = NULL,
    aulast = NULL, date = NULL, spage = NULL, issue = NULL,
    version = 0.1, format = "json",
    key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")))
}
\arguments{
  \item{genre}{Book genre}

  \item{title}{Book title}

  \item{aufirst}{First author}

  \item{aulast}{Last author}

  \item{date}{Date of publication}

  \item{spage}{Start page}

  \item{issue}{Issue number}

  \item{version}{One of 0.1 or 1.0}

  \item{format}{either XML ("xml") or JSON ("json") format}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\description{
  Not sure how this differs from their other API...
}
\examples{
\dontrun{
openurl(
	genre="book",
	title="Manual+of+North+American+Diptera",
	aufirst="Samuel Wendell",
	aulast="Williston",
	date=1908,
	spage=16)
}
}

