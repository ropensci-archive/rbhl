# GetLanguages.R

GetLanguages <- 
# Args:
#   pretty: print pretty, as data.frame (TRUE/FALSE)
# Examples: 
#   GetLanguages()
#   GetLanguages(pretty = T)
function(pretty = FALSE,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'GetLanguages', apikey = key, format = format)
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  temp <- fromJSON(I(tt))
  if(!pretty == TRUE) {temp} else {ldply(nn$Result, identity)}
}