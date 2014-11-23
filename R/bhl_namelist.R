#' List the unique names.
#'
#' By using the startrow and batchsize parameters appropriately, you can
#'    pull the list all at once, or in batches (i.e. 1000 names at a time).
#'    Names both with and without NameBank identifiers are returned.
#'
#' @param startrow first name to return (if using as an offset)
#' @param batchsize number of names to return (numeric)
#' @param startdate (optional) start date of range between which to count names (date)
#' @param enddate (optional) end date of range between which to count names (date)
#' @template all
#' @export
#' @examples \dontrun{
#' bhl_namelist(startrow=1, batchsize=99, startdate='10/15/2009', enddate='10/16/2009')
#' bhl_namelist(startrow=1, batchsize=5, startdate='10/15/2009', enddate='10/31/2009',
#'    format='json', output='raw')
#' }

bhl_namelist <- function(startrow = NULL, batchsize = NULL, startdate = NULL,
  enddate = NULL, format = "json", output = 'list', key = NULL, callopts = list())
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "NameList", apikey = check_key(key), format = format, startrow = startrow,
                       batchsize = batchsize, startdate = startdate, enddate = enddate))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
