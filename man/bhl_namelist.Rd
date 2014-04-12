\name{bhl_namelist}
\alias{bhl_namelist}
\title{List the unique names.}
\usage{
bhl_namelist(startrow = NULL, batchsize = NULL, startdate = NULL,
  enddate = NULL, format = "json", output = "list", key = NULL,
  callopts = list())
}
\arguments{
  \item{startrow}{first name to return (if using as an
  offset)}

  \item{batchsize}{number of names to return (numeric)}

  \item{startdate}{(optional) start date of range between
  which to count names (date)}

  \item{enddate}{(optional) end date of range between which
  to count names (date)}

  \item{format}{either XML ('xml') or JSON ('json') format.
  If output='list', format is forced to equal 'json'}

  \item{output}{Return a list, raw json or xml, or parsed
  data (character).  Default: 'list'}

  \item{key}{your BHL API key, either enter, or loads from
  .Rprofile}

  \item{callopts}{Call options passed on to httr::GET.}
}
\description{
By using the startrow and batchsize parameters
appropriately, you can pull the list all at once, or in
batches (i.e. 1000 names at a time).  Names both with and
without NameBank identifiers are returned.
}
\examples{
\dontrun{
bhl_namelist(startrow=1, batchsize=99, startdate='10/15/2009', enddate='10/16/2009')
bhl_namelist(startrow=1, batchsize=5, startdate='10/15/2009', enddate='10/31/2009',
   format='json', output='raw')
}
}

