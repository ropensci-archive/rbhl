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
  key = NULL, callopts = list()) 
{
  if(output=='list') format='json'
  key <- getkey(key)
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op="NameGetDetail", apikey=key, 
                       namebankid=namebankid, name=name, format=format))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  return_results(tt, output, format)
}