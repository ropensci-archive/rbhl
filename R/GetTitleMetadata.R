# GetTitleMetadata.R

GetTitleMetadata <- 
# Args:
#   titleid: XXXXX (character)
#   items: XXXXXXXX (character)
# Examples: 
#   GetTitleMetadata(1726, TRUE)

function(titleid = NA, items = FALSE,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {

  args <- list(op = 'GetTitleMetadata', apikey = key, format = format)
  if(!is.na(titleid))
    args$titleid <- titleid
  if(items == 'TRUE') {args$items <- 't'} else
    if(items == 'FALSE') {args$items <- NULL}
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  outprod <- fromJSON(I(tt))
  return(outprod)
}