#' R interface to the Biodiversity Heritage Library API.
#'
#' You need an API key to use the Biodiversity Heritage Library API. Get your
#' BHL API key at <http://www.biodiversitylibrary.org/getapikey.aspx>.
#' Put your API key in your .Rprofile file using e.g.,
#' `options(BioHerLibKey = "YOURBHLAPIKEY")`, and the functions within
#' this package will be able to use your API key without you having to enter
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
#' \itemize{
#'  \item `bhl_getpartendnote()`: BHL removed this API method.
#'  \item `bhl_gettitleendnote()`: BHL removed this API method.
#' }
#'
#' @name rbhl-defunct
NULL
