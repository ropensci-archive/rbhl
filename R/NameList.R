# NameList.R

NameList <- 
# Args:
#   startrow: first name to return (if are returning names in batches of 100, 
#     specify startrow=1 for the first batch, startrow=101 for the second batch, 
#     and so on (numeric)
#   batchsize: number of names to return (numeric)
#   startdate: (optional) start date of range between which to count names (date)
#   enddate: (optional) end date of range between which to count names (date)
# Examples: 
#   NameList(1, 1000, '10/15/2009', '10/31/2009')
function(startrow = NA, batchsize = NA, startdate = NA, enddate = NA, 
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json') {
    
  args <- list(op = 'NameList', apikey = key, format = format)
  if(!is.na(startrow))
    args$startrow <- startrow
  if(!is.na(batchsize))
    args$batchsize <- batchsize
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