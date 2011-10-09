# TitleSearchSimple.R

TitleSearchSimple <- 
# Args:
#   title: full or partial title for which to search (character)
# Examples: 
#   TitleSearchSimple("nematocerous")
#   TitleSearchSimple("husbandry")
function(title = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'TitleSearchSimple', apikey = key, format = format)
  if(!is.na(title))
    args$title <- title
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  fromJSON(I(tt))
}