# BookSearch.R

BookSearch <- 
# Args:
#   title: string to search for in the title (character)
#   lname: last name to search for (character)
#   volume: volume to search for (numeric)
#   edition: edition to search for (character)
#   year: year to search for, four characters, e.g, 1970 (numeric)
#   collectionid: collection identifier to search for (numeric)
#   language: language to search for (character)
# Notes:
#   --Use GetCollections() or GetLanguages() to get acceptable terms
# Examples: 
#   BookSearch("Selborne", "White", 2, "new", 1825, 4, "eng")
#   out <- BookSearch("evolution")
function(title = NA, lname = NA, volume = NA, edition = NA, 
  year = NA, collectionid = NA, language = NA,
  url = 'http://www.biodiversitylibrary.org/api2/httpquery.ashx',
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")),
  ..., 
  curl = getCurlHandle(),
  format = 'json' ) {
    
  args <- list(op = 'BookSearch', apikey = key, format = format)
  if(!is.na(title))
    args$title <- title
  if(!is.na(lname))
    args$lname <- lname
  if(!is.na(volume))
    args$volume <- volume
  if(!is.na(edition))
    args$edition <- edition
  if(!is.na(year))
    args$year <- year
  if(!is.na(collectionid))
    args$collectionid <- collectionid
  if(!is.na(language))
    args$language <- language
  tt <- getForm(url, 
    .params = args, 
    ..., 
    curl = curl)
  fromJSON(I(tt))
}