#' @title rbhl
#' @description R interface to the Biodiversity Heritage Library API.
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
#' @importFrom tibble as_tibble
#' @importFrom jsonlite fromJSON
#' @name rbhl-package
#' @aliases rbhl
#' @docType package
#' @title R interface to the Biodiversity Heritage Library API.
#' @author Scott Chamberlain
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
#' - `bhl_getpartendnote()`: BHL removed this API method.
#' - `bhl_gettitleendnote()`: BHL removed this API method.
#' - [bhl_booksearch()]: method removed in API v3, see
#' [bhl_publicationsearch()]
#' - [bhl_partsearch()]: method removed in API v3, see
#' [bhl_publicationsearch()]
#' - [bhl_titlesearchsimple()]: method removed in API v3, see
#' [bhl_publicationsearch()]
#' - [bhl_getauthorparts()]: method removed in API v3, see
#' [bhl_getauthormetadata()]
#' - [bhl_getauthortitles()]: method removed in API v3, see
#' [bhl_getauthormetadata()]
#' - [bhl_getitembyidentifier()]: method removed in API v3, see
#' [bhl_getitemmetadata()]
#' - [bhl_getitempages()]: method removed in API v3, see
#' [bhl_getitemmetadata()]
#' - [bhl_getitemparts()]: method removed in API v3, see
#' [bhl_getitemmetadata()]
#' - [bhl_getpagenames()]: method removed in API v3, see
#' [bhl_getpagemetadata()]
#' - [bhl_getpageocrtext()]: method removed in API v3, see
#' [bhl_getpagemetadata()]
#' - [bhl_getpartbyidentifier()]: method removed in API v3, see
#' [bhl_getpartmetadata()]
#' - [bhl_getpartnames()]: method removed in API v3, see
#' [bhl_getpartmetadata()]
#' - [bhl_getsubjectparts()]: method removed in API v3, see
#' [bhl_subjectmetadata()]
#' - [bhl_getsubjecttitles()]: method removed in API v3, see
#' [bhl_subjectmetadata()]
#' - [bhl_getpartbibtex()]: method removed in API v3
#' - [bhl_gettitlebibTex()]: method removed in API v3
#' - [bhl_gettitlebyidentifier()]: API method merged in API v3, see
#' [bhl_gettitlemetadata()]
#' - [bhl_gettitleitems()]: API method merged in API v3, see
#' [bhl_gettitlemetadata()]
#' - [bhl_getunpublisheditems()]: method removed in API v3
#' - [bhl_getunpublishedparts()]: method removed in API v3
#' - [bhl_getunpublishedtitles()]: method removed in API v3
#' - [bhl_namecount()]: method removed in API v3
#' - [bhl_namelist()]: method removed in API v3
#' - `bhl_namegetdetail()`: method renamed - see [bhl_namemetadata()]
#'
#' @name rbhl-defunct
NULL
