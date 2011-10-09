# NameGetDetail.R

NameGetDetail <- 
# Args:
#   namebankid: (not used if "name" specified) NameBank identifier for a name (numeric)
#   name: (not used if "namebankid" specified) a complete name string (character)
# Examples: 
#   NameGetDetail(namebankid = 3501464)
#   NameGetDetail(name = 'poa annua supina')
function(namebankid = NA, name = NA, 
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json') {
    
  args <- list(op = 'NameGetDetail', apikey = key, format = format)
  if(!is.na(namebankid))
    args$namebankid <- namebankid
  if(!is.na(name))
    args$name <- name
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  fromJSON(I(tt))
}