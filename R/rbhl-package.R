#' R interface to the Biodiversity Heritage Library API.
#'
#' You need an API key to use the Biodiversity Heritage Library API. Get your
#' BHL API key at <http://www.biodiversitylibrary.org/getapikey.aspx>.
#' Put your API key either in your .Renviron file (or similar) with the name 
#' `BHL_KEY`, or in your .Rprofile file with the name `bhl_key`, and the 
#' we'll use your API key without you having to enter
#' it every time you run a search.
#'
#' See [rbhl-defunct] for defunct functions.
#'
#' @importFrom xml2 xml_find_all read_xml xml_children
#' @name rbhl-package
#' @aliases rbhl
#' @docType package
#' @title R interface to the Biodiversity Heritage Library API.
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL

#' Data.frame of all the BHL API methods from the BHL website.
#'
#' @name rbhlmethods
#' @docType data
#' @keywords datasets
NULL

#' Defunct functions in rbhl
#'
#' These functions are gone, no longer available.
#'
#' - `bhl_getpartendnote()`: BHL removed this API method.
#' - `bhl_gettitleendnote()`: BHL removed this API method.
#'
#' @name rbhl-defunct
NULL
