\name{bhl_openurl}
\alias{bhl_openurl}
\title{Not sure how this differs from their other API...}
\usage{
bhl_openurl(genre = NULL, title = NULL, aufirst = NULL, aulast = NULL,
  date = NULL, spage = NULL, issue = NULL, version = 0.1,
  format = "json", key = NULL, output = "list", callopts = list())
}
\arguments{
  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{genre}{Book genre}

  \item{title}{Book title}

  \item{aufirst}{First author}

  \item{aulast}{Last author}

  \item{date}{Date of publication}

  \item{spage}{Start page}

  \item{issue}{Issue number}

  \item{version}{One of 0.1 or 1.0}
}
\description{
Not sure how this differs from their other API...
}
\examples{
\dontrun{
bhl_openurl(
	genre="book",
	title="Manual+of+North+American+Diptera",
	aufirst="Samuel Wendell",
	aulast="Williston",
	date=1908,
	spage=16)

bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
   aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16, output='raw')

bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
   aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16, output='parsed')

bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
   aufirst="Samuel Wendell", aulast="Williston", date=1908, spage=16,
   format='xml', output='parsed')
}
}

