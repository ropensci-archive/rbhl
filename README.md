rbhl
====

[![Build Status](https://api.travis-ci.org/ropensci/rbhl.png)](https://travis-ci.org/ropensci/rbhl)

This is an R interface to the Biodiversity Heritage Library API. 

Get your Biodiversity Heritage Library API key [here](http://www.biodiversitylibrary.org/getapikey.aspx)

Put your API in your .Rprofile file using e.g., `options(BioHerLibKey = "YOURBHLAPIKEY")`, and the functions within this package will be able to use your API key without you having to enter it every time you run a search. 

Biodiversity Heritage Library API documentation [here](http://www.biodiversitylibrary.org/api2/docs/docs.html).

Biodiversity Heritage Library OpenURL documentation [here](http://www.biodiversitylibrary.org/openurlhelp.aspx).

`rbhl` is part of the rOpenSci project, visit http://ropensci.org to learn more.

## Quickstart

### Install `rbhl` from GitHub:

```R
install.packages("devtools")
require(devtools)
install_github("rbhl", "ropensci")
require(rbhl)
```

### Name search

```coffee
bhl_namesearch(name='helianthus annuus')
```

```coffee
   NameBankID EOLID NameFound                                      NameConfirmed Titles
1     2658020            none                                  Helianthus annuus   none
2     8722653            none                     Helianthus annuus californicus   none
3     8507133            none                         Helianthus annuus citrinus   none
4     8624358            none                        Helianthus annuus coronatus   none
5      462478            none                               Helianthus annuus L.   none
6     3889596            none                     Helianthus annuus lenticularis   none
7                        none                         Helianthus annuus Linnaeus   none
8     8639717            none                       Helianthus annuus petiolaris   none
9     1736383            none              Helianthus annuus ssp. texanus Heiser   none
10    8722723            none                        Helianthus annuus uniflorus   none
11    1746528            none Helianthus annuus var. macrocarpus (DC.) Cockerell   none
12    8722760            none                          Helianthus annuus zonatus   none
```

### Get title metadata

```coffee
bhl_gettitlemetadata(1726, TRUE)
```

```coffee
$Status
[1] "ok"

$ErrorMessage
NULL

$Result
$Result$TitleID
[1] 1726

$Result$BibliographicLevel
[1] "Monograph/Item"

$Result$FullTitle
[1] "The anatomy of the mouth-parts and of the sucking apparatus of some Diptera.  "

$Result$ShortTitle
[1] "The anatomy of the mouth-parts and of the sucking apparatus of some Diptera."

$Result$SortTitle
[1] "anatomy of the mouth-parts and of the sucking apparatus of"

$Result$PartNumber
NULL

$Result$PartName
NULL

$Result$CallNumber
[1] "QL538 .D58"

$Result$Edition
NULL

$Result$PublisherPlace
[1] "Boston,"

$Result$PublisherName
[1] "A. Williams & co.,"

$Result$PublicationDate
[1] "1881."

$Result$PublicationFrequency
NULL

$Result$Doi
[1] "10.5962/bhl.title.1726"

$Result$TitleUrl
[1] "http://www.biodiversitylibrary.org/bibliography/1726"

$Result$Authors
$Result$Authors[[1]]
$Result$Authors[[1]]$CreatorID
[1] 1970

$Result$Authors[[1]]$Name
[1] "Dimmock, George,"

$Result$Authors[[1]]$Role
[1] "Main Entry -- Personal Name (MARC 100)"

$Result$Authors[[1]]$Numeration
[1] ""

$Result$Authors[[1]]$Unit
[1] ""

$Result$Authors[[1]]$Title
[1] ""

$Result$Authors[[1]]$Location
[1] ""

$Result$Authors[[1]]$FullerForm
[1] ""

$Result$Authors[[1]]$Dates
[1] "1852-"

$Result$Authors[[1]]$CreatorUrl
NULL



$Result$Subjects
$Result$Subjects[[1]]
SubjectText 
  "Diptera" 


$Result$Identifiers
$Result$Identifiers[[1]]
 IdentifierName IdentifierValue 
          "DLC"      "08023002" 

$Result$Identifiers[[2]]
 IdentifierName IdentifierValue 
      "MARC001"          "1223" 

$Result$Identifiers[[3]]
 IdentifierName IdentifierValue 
         "OCLC"       "2992225" 


$Result$Collections
NULL

$Result$Variants
list()

$Result$Items
$Result$Items[[1]]
$Result$Items[[1]]$ItemID
[1] 16800

$Result$Items[[1]]$PrimaryTitleID
[1] 1726

$Result$Items[[1]]$ThumbnailPageID
[1] 1328691

$Result$Items[[1]]$Source
[1] "Internet Archive"

$Result$Items[[1]]$SourceIdentifier
[1] "anatomyofmouthpa00dimm"

$Result$Items[[1]]$Volume
[1] ""

$Result$Items[[1]]$Year
NULL

$Result$Items[[1]]$Contributor
[1] "MBLWHOI Library, Woods Hole"

$Result$Items[[1]]$Sponsor
[1] "MBLWHOI Library"

$Result$Items[[1]]$Language
[1] "English"

$Result$Items[[1]]$LicenseUrl
[1] ""

$Result$Items[[1]]$Rights
[1] ""

$Result$Items[[1]]$DueDiligence
[1] ""

$Result$Items[[1]]$CopyrightStatus
[1] ""

$Result$Items[[1]]$CopyrightRegion
[1] ""

$Result$Items[[1]]$ItemUrl
[1] "http://www.biodiversitylibrary.org/item/16800"

$Result$Items[[1]]$TitleUrl
[1] "http://www.biodiversitylibrary.org/bibliography/1726"

$Result$Items[[1]]$ItemThumbUrl
[1] "http://www.biodiversitylibrary.org/pagethumb/1328691"

$Result$Items[[1]]$Pages
NULL

$Result$Items[[1]]$Parts
NULL

$Result$Items[[1]]$Collections
NULL
```


### Meta

Please report any issues or bugs](https://github.com/ropensci/rbhl/issues).

License: CC0

This package is part of the [rOpenSci](http://ropensci.org/packages) project.

To cite package `rbhl` in publications use:

```coffee
To cite package ‘rbhl’ in publications use:

  Scott Chamberlain and Karthik Ram (2013). rbhl: R interface to the
  Biodiversity Heritage Library.. R package version 0.0.6.
  https://github.com/ropensci/rbhl

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {rbhl: R interface to the Biodiversity Heritage Library.},
    author = {Scott Chamberlain and Karthik Ram},
    year = {2013},
    note = {R package version 0.0.6},
    url = {https://github.com/ropensci/rbhl},
  }
```

Get citation information for `rbhl` in R doing `citation(package = 'rbhl')`

[![](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)