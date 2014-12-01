rbhl
====

[![Build Status](https://api.travis-ci.org/ropensci/rbhl.png)](https://travis-ci.org/ropensci/rbhl)
[![Build status](https://ci.appveyor.com/api/projects/status/ej5u9mdirg1yyteg/branch/master)](https://ci.appveyor.com/project/sckott/rbhl/branch/master)

`rbhl` is an R interface to the Biodiversity Heritage Library API.

## Info

Authentication:

* Get your Biodiversity Heritage Library API key [here](http://www.biodiversitylibrary.org/getapikey.aspx)
* Put your API in your .Rprofile file using e.g., `options(BioHerLibKey = "YOURBHLAPIKEY")`, and the functions within this package will be able to use your API key without you having to enter it every time you run a search.

Documentation:

* Biodiversity Heritage Library API documentation [here](http://www.biodiversitylibrary.org/api2/docs/docs.html).
* Biodiversity Heritage Library OpenURL documentation [here](http://www.biodiversitylibrary.org/openurlhelp.aspx).

## Quickstart

### Installation

Stable version from CRAN


```r
install.packages("rbhl")
```

Development version from GitHub


```r
install.packages("devtools")
devtools::install_github("ropensci/rbhl")
```


```r
library("rbhl")
```

### Output formats

You can output various formats using the `as` parameter, setting to `table`, `list`, `json` or `xml`. 

The default is usually `table`:


```r
bhl_authorsearch(name='dimmock')
```

```
##   CreatorID             Name Role Numeration Unit Title Location
## 1      1970 Dimmock, George,   NA                               
## 2      8126 Dimmock, George,   NA                               
##   FullerForm Relationship TitleOfWork     Dates
## 1                      NA          NA     1852-
## 2                      NA          NA 1852-1930
##                                        CreatorUrl
## 1 http://www.biodiversitylibrary.org/creator/1970
## 2 http://www.biodiversitylibrary.org/creator/8126
```

list output


```r
bhl_authorsearch(name='dimmock', as='list')$Result[[1]]
```

```
## $CreatorID
## [1] 1970
## 
## $Name
## [1] "Dimmock, George,"
## 
## $Role
## NULL
## 
## $Numeration
## [1] ""
## 
## $Unit
## [1] ""
## 
## $Title
## [1] ""
## 
## $Location
## [1] ""
## 
## $FullerForm
## [1] ""
## 
## $Relationship
## NULL
## 
## $TitleOfWork
## NULL
## 
## $Dates
## [1] "1852-"
## 
## $CreatorUrl
## [1] "http://www.biodiversitylibrary.org/creator/1970"
```

XML output


```r
bhl_authorsearch(name='dimmock', as='xml')
```

```
## [1] "﻿<?xml version=\"1.0\" encoding=\"utf-8\"?><Response xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><Status>ok</Status><Result><Creator><CreatorID>1970</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/1970</CreatorUrl></Creator><Creator><CreatorID>8126</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-1930</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/8126</CreatorUrl></Creator></Result></Response>"
```

JSON output


```r
bhl_authorsearch(name='dimmock', as='json')
```

```
## [1] "{\"Status\":\"ok\",\"ErrorMessage\":null,\"Result\":[{\"CreatorID\":1970,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"1852-\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/1970\"},{\"CreatorID\":8126,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"1852-1930\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/8126\"}]}"
```

### Get title metadata


```r
bhl_gettitlemetadata(titleid = 1726, items = TRUE, as="list")$Result$Items
```

```
## [[1]]
## [[1]]$ItemID
## [1] 16800
## 
## [[1]]$PrimaryTitleID
## [1] 1726
## 
## [[1]]$ThumbnailPageID
## [1] 1328691
## 
## [[1]]$Source
## [1] "Internet Archive"
## 
## [[1]]$SourceIdentifier
## [1] "anatomyofmouthpa00dimm"
## 
## [[1]]$Volume
## [1] ""
## 
## [[1]]$Year
## NULL
## 
## [[1]]$Contributor
## [1] "MBLWHOI Library"
## 
## [[1]]$Sponsor
## [1] "MBLWHOI Library"
## 
## [[1]]$Language
## [1] "English"
## 
## [[1]]$LicenseUrl
## [1] ""
## 
## [[1]]$Rights
## [1] ""
## 
## [[1]]$DueDiligence
## [1] ""
## 
## [[1]]$CopyrightStatus
## [1] ""
## 
## [[1]]$CopyrightRegion
## [1] ""
## 
## [[1]]$ExternalUrl
## [1] ""
## 
## [[1]]$ItemUrl
## [1] "http://www.biodiversitylibrary.org/item/16800"
## 
## [[1]]$TitleUrl
## [1] "http://www.biodiversitylibrary.org/bibliography/1726"
## 
## [[1]]$ItemThumbUrl
## [1] "http://www.biodiversitylibrary.org/pagethumb/1328691"
## 
## [[1]]$Pages
## NULL
## 
## [[1]]$Parts
## NULL
## 
## [[1]]$Collections
## NULL
```

### Book search


```r
bhl_booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825, collectionid=4, language='eng')
```

```
##   TitleID BibliographicLevel
## 1   32868                   
##                                                                                                                FullTitle
## 1 The natural history of Selborne : to which are added the naturalist's calendar, miscellaneous observations, and poems.
##   ShortTitle SortTitle PartNumber PartName CallNumber
## 1         NA        NA                             NA
##                       Edition PublisherPlace
## 1 A new ed., with engravings.         London
##                            PublisherName PublicationDate
## 1 Printed for C. and J. Rivington [etc.]            1825
##   PublicationFrequency Doi
## 1                   NA  NA
##                                                TitleUrl
## 1 http://www.biodiversitylibrary.org/bibliography/32868
##                                                                                      Authors
## 1 9572, White, Gilbert,, Main Entry -- Personal Name (MARC 100), , , , , , , , 1720-1793, NA
##   Subjects Identifiers Collections Variants
## 1       NA          NA          NA       NA
##                                                                                                                                                                                                                  Items
## 1 71924, NA, NA, NA, NA, 2, NA, Gerstein - University of Toronto (archive.org), NA, NA, NA, NA, NA, NA, NA, NA, http://www.biodiversitylibrary.org/item/71924, NA, NA, NA, NA, 4, Charles Darwin's Library, NA, NA, NA
```

### Search titles


```r
head( bhl_titlesearchsimple('husbandry') )
```

```
##   TitleID BibliographicLevel
## 1   25997     Monograph/Item
## 2   44403     Monograph/Item
## 3   27062     Monograph/Item
## 4   41956     Monograph/Item
## 5   44462     Monograph/Item
## 6   28081     Monograph/Item
##                                                                                                                                                                                                                                                                                  FullTitle
## 1                                                                                                                                                                                          An account of the systems of husbandry adopted in the more improved districts of Scotland ...  
## 2                                                                                   An account of the systems of husbandry adopted in the more improved districts of Scotland : with some observations on the improvements of which they are susceptible ... / by Sir John Sinclair, Bart.
## 3    The American farmer's instructor, or Practical agriculturist; comprehending the cultivation of plants, the husbandry of the domestic animals, and the economy of the farm; together with a variety of information which will be found important to the farmer. By Francis S. Wiggins.
## 4 The American farmer's instructor, or, practical agriculturist : comprehending the cultivation of plants, the husbandry of the domestic animals, and the economy of the farm; together with a variety of information which will be found important to the farmer / by Francis S. Wiggins.
## 5   The American farmer's instructor, or, Practical agriculturist comprehending the cultivation of plants, the husbandry of the domestic animals, and the economy of the farm, together with a variety of information which will be found important to the farmer / by Francis S. Wiggins.
## 6                                                                                                       American husbandry. Being a series of essays on agriculture. Comp. principally from "The Cultivator" and "The Genesee farmer". With additions by Willis Gaylord and Luther Tucker.
##                                                                                      ShortTitle
## 1 An account of the systems of husbandry adopted in the more improved districts of Scotland ...
## 2   An account of the systems of husbandry adopted in the more improved districts of Scotland :
## 3                                 The American farmer's instructor, or Practical agriculturist;
## 4                               The American farmer's instructor, or, practical agriculturist :
## 5                                 The American farmer's instructor, or, Practical agriculturist
## 6                                                                           American husbandry.
##                                                      SortTitle PartNumber
## 1  account of the systems of husbandry adopted in the more imp       <NA>
## 2 account of the systems of husbandry adopted in the more impr       <NA>
## 3 American farmer's instructor, or Practical agriculturist; co       <NA>
## 4 American farmer's instructor, or, practical agriculturist :        <NA>
## 5 American farmer's instructor, or, Practical agriculturist co       <NA>
## 6 American husbandry. Being series of essays on agriculture. C       <NA>
##   PartName CallNumber Edition PublisherPlace
## 1     <NA>         NA 2d ed.     Edinburgh :
## 2     <NA>         NA    <NA>    Edinburgh :
## 3     <NA>         NA    <NA>  Philadelphia,
## 4     <NA>         NA    <NA> Philadelphia :
## 5     <NA>         NA    <NA> Philadelphia :
## 6     <NA>         NA    <NA>     New York :
##                                        PublisherName PublicationDate
## 1                                      A. Constable,           1813.
## 2 Printed for Arch. Constable by Abernethy & Walker,           1812.
## 3                                         O. Rogers,           1840.
## 4              Orrin Rogers, 67 South Second Street,            1840
## 5                                      Orrin Rogers,           1840.
## 6                                            Harper,           1864.
##   PublicationFrequency Doi TitleUrl Authors Subjects Identifiers
## 1                 <NA>  NA       NA      NA       NA          NA
## 2                 <NA>  NA       NA      NA       NA          NA
## 3                 <NA>  NA       NA      NA       NA          NA
## 4                 <NA>  NA       NA      NA       NA          NA
## 5                 <NA>  NA       NA      NA       NA          NA
## 6                 <NA>  NA       NA      NA       NA          NA
##   Collections Variants Items
## 1          NA       NA    NA
## 2          NA       NA    NA
## 3          NA       NA    NA
## 4          NA       NA    NA
## 5          NA       NA    NA
## 6          NA       NA    NA
```

### Get languages


```r
head( bhl_getlanguages() )
```

```
##   LanguageCode LanguageName
## 1          AFR    Afrikaans
## 2          ARA       Arabic
## 3          ARC      Aramaic
## 4          BUL    Bulgarian
## 5          BUR      Burmese
## 6          CAR        Carib
```

## Meta

* Please report any issues or bugs](https://github.com/ropensci/rbhl/issues).
* License: MIT
* Get citation information for `rbhl` in R doing `citation(package = 'rbhl')`

[![](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
