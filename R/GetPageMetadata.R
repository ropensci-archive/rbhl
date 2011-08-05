# GetPageMetadata.R

GetPageMetadata <- 
# Args:
#   page: page number to get
#   ocrtext: return ocr text of the page (TRUE/FALSE)
#   names: return the names that appear on the page (TRUE/FALSE)
#   format: json or xml (character)
# Examples: 
#   GetPageMetadata('1328690', FALSE, FALSE, 'json')

function(page = NA, ocrtext = FALSE, names = FALSE, format = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle() ) {

  args <- list(op = 'GetPageMetadata', apikey = key)
  if(!is.na(page))
    args$pageid <- page
  if(!is.na(format))
    args$format <- format
  if(ocrtext == 'TRUE') {args$ocr <- 't'} else
    if(ocrtext == 'FALSE') {args$ocr <- NULL}
  if(names == 'TRUE') {args$names <- 't'} else
    if(names == 'FALSE') {args$names <- NULL}
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  if(format == 'json') {outprod <- fromJSON(I(tt))} else
      if(format == 'xml') {outprod <- xmlTreeParse(I(tt))}
  return(outprod)
}