# GetTitleItems.R

GetTitleItems <- 
# Args:
#   titleid: the identifier of an individual title (numeric)
# Examples: 
#   GetTitleItems(1726)  
function(titleid = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'GetTitleItems', apikey = key, format = format)
  if(!is.na(titleid))
    args$titleid <- titleid
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  fromJSON(I(tt))
}