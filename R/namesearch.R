#' namesearch
#'
#' @import RCurl RJSONIO plyr
#' @param name species name (character)
#' @inheritParams authorsearch
#' @export
#' @examples \dontrun{
#' namesearch('poa annua')
#' namesearch('helianthus annuus')
#' }
namesearch <- function(name = NA, format = "json",
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx", 
  key = getOption("BioHerLibKey", stop("need an API key for the Biod Her Library")), 
  ..., curl = getCurlHandle()) 
{
    args <- list(op = "NameSearch", apikey = key, format = format)
    if (!is.na(name)) 
        args$name <- name
    tt <- getForm(url, .params = args, ..., curl = curl)
    outprod <- fromJSON(I(tt))
    getit <- function(x) {
        if (is.null(x[[1]]) == TRUE) 
            x[[1]] <- paste("nonamebankID")
        t(ldply(x))[2, ]
    }
    outdf <- ldply(outprod[3][[1]], getit)
    names(outdf) <- c("NameBankID", "NameConfirmed")
    outdf
}