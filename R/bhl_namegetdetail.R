#' Get basic title, item, and page metadata for each page on which the specified
#' name appears.
#'
#' @param namebankid (not used if 'name' specified) NameBank identifier for a
#' name (numeric)
#' @param name (not used if 'namebankid' specified) a complete name string (character)
#' @template all
#' @export
#' @examples \dontrun{
#' bhl_namegetdetail(namebankid = 3501464)
#' bhl_namegetdetail(name = 'poa annua supina')
#' }

bhl_namegetdetail <- function(namebankid = NA, name = NA, format='json', output = 'list',
  key = NULL, ...)
{
  if(output=='list') format='json'
  args <- compact(list(op="NameGetDetail", apikey=check_key(key),
                       namebankid=namebankid, name=name, format=format))
  out <- GET(bhl_url(), query = args, ...)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}
