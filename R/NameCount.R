# NameCount.R

NameCount <- 
# Args:
#   startdate: (optional) start date of range between which to count names (date)
#   enddate: (optional) end date of range between which to count names (date)
# Examples: 
#   NameCount('10/15/2009', '10/31/2009')
function(startdate = NA, enddate = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'NameCount', apikey = key, format = format)
  if(!is.na(startdate))
    args$startdate <- startdate
  if(!is.na(enddate))
    args$enddate <- enddate
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  fromJSON(I(tt))
}