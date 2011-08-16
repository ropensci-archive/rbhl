# GetItemPages.R

GetItemPages <- 
# Args:
#   itemid: the item id (character)
# Examples: 
#   GetItemPages('16800')

function(itemid = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {

  args <- list(op = 'GetItemPages', apikey = key, format = format)
  if(!is.na(itemid))
    args$itemid <- itemid
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  outprod <- fromJSON(I(tt))
  return(outprod)
}