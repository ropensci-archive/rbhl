# GetTitleBibTex.R

GetTitleBibTex <- 
# Args:
#   titleid: the identifier of an individual title (numeric)
#   justresult: just print result? (TRUE/FALSE)
# Examples: 
#   GetTitleBibTex("1726")
#   GetTitleBibTex("1726", TRUE)
function(titleid = NA, justresult = FALSE,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'GetTitleBibTex', apikey = key, format = format)
  if(!is.na(titleid))
    args$titleid <- titleid
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  temp <- fromJSON(I(tt))
  if(!justresult == TRUE) {temp} else {temp$Result}
}