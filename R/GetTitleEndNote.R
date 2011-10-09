# GetTitleEndNote.R

GetTitleEndNote <- 
# Args:
#   titleid: the identifier of an individual title (numeric)
#   justresult: just print result? (TRUE/FALSE)
# Examples: 
#   GetTitleEndNote("1726")
#   GetTitleEndNote("1726", TRUE)
function(titleid = NA, justresult = FALSE,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'GetTitleEndNote', apikey = key, format = format)
  if(!is.na(titleid))
    args$titleid <- titleid
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  temp <- fromJSON(I(tt))
  if(!justresult == TRUE) {temp} else {temp$Result}
}