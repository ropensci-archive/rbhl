# SubjectSearch.R

SubjectSearch <- 
# Args:
#   subject: the full or partial subject for which to search (character)
# Examples: 
#   SubjectSearch("diptera")
function(subject = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'SubjectSearch', apikey = key, format = format)
  if(!is.na(subject))
    args$subject <- subject
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  fromJSON(I(tt))
}