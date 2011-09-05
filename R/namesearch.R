# namesearch.R

namesearch <- 
# Args:
#   species: species name (character)
#   format: json or xml (character)
# Examples: 
#   namesearch(species = "poa annua", format = "json")
#   namesearch(species = "helianthus annuus", format = "json")

function(species = NA, format = NA,
  method = 'NameSearch', 
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle()) 
{
#   args <- list(op = 'NameSearch', apikey = key)
#   if(!is.na(species))
#     args$name <- gsub(" ", "+", species)
#   if(!is.na(format))
#     args$format <- format
  speciess <- gsub(" ", "+", species)
  url2 <- paste(url, "?op=", method, "&name=", speciess, "&apikey=", key, "&format=", format, sep = "")
  tt <- getURLContent(url2)
#   tt <- getForm(url, 
#     .params = args, 
#     ..., 
#     curl = curl)
  if(format == 'json') {outprod <- fromJSON(I(tt))} else
      if(format == 'xml') {outprod <- xmlTreeParse(I(tt))}
  getit <- function(x) {
    if(is.null(x[[1]]) == TRUE) x[[1]] <- paste("nonamebankID")
    t(ldply(x))[2,]
  }
  outdf <- ldply(outprod[3][[1]], getit)
  names(outdf) <- c("NameBankID", "NameConfirmed")
  return(outdf)
}