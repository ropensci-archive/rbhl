\name{query2message}
\alias{query2message}
\title{Internal function to convert API query to message printed in the console.}
\usage{
  query2message(url, x)
}
\arguments{
  \item{url}{The base url for the API.}

  \item{x}{List of named parameters to be used in API
  call.}
}
\description{
  Internal function to convert API query to message printed
  in the console.
}
\examples{
\donttest{
url <- "http://ropensci.org/"
args <- list(species='frog',author='joe')
message(query2message(url, args))
}
}

