# GetUnpublishedItems.R

GetUnpublishedItems <- 
# Args:
#   NONE
# Examples: 
#   GetUnpublishedItems()

function(url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {

  args <- list(op = 'GetUnpublishedItems', apikey = key, format = format)
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  outprod <- fromJSON(I(tt))
  return(outprod)
}
