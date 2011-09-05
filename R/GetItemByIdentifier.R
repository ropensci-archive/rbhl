# GetItemByIdentifier.R

GetItemByIdentifier <- 
# Args:
#   type: the type of identifier (barcode or ia) (character)
#   value: the identifier value (character)
#   format: json or xml (character)
# Examples: 
#   GetItemByIdentifier('ia', 'animalkingdomarr03cuvi', 'json')

function(type = NA, value = NA, format = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle() ) {

  args <- list(op = 'GetItemByIdentifier', apikey = key)
  if(!is.na(type))
    args$type <- type
  if(!is.na(value))
    args$value <- value
  if(!is.na(format))
    args$format <- format
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  if(format == 'json') {outprod <- fromJSON(I(tt))} else
      if(format == 'xml') {outprod <- xmlTreeParse(I(tt))}
  return(outprod)
}