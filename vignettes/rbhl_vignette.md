<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{rbhl vignette}
-->

R interface to the Biodiversity Heritage Library
======

### About the package

`rbhl` is an R interface to the Biodiversity Heritage Library.

********************

### Install `rbhl`

First, install and load `rbhl` into the R session.


```r
install.packages("rbhl")
```



```r
library(rbhl)
```


Advanced users can also download and install the latest development copy from [GitHub](https://github.com/ropensci/rbhl_) by doing


```r
install_github("rbhl", "ropensci")
```


### Output formats

You can output various formats using the `format` parameter, setting to 'json' or 'xml'. Use in combination with `output` to get a `list`, `raw` data (json or xml, set via `format`), or `parsed` data. The parsed option will eventually attempt to coerce data to a data.frame to ease consumption of data, but most functions currently return a list when `output=parsed`.

Raw output, in xml format


```r
bhl_authorsearch(name = "dimmock", format = "xml", output = "raw")
```

```
## [1] "﻿<?xml version=\"1.0\" encoding=\"utf-8\"?><Response xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><Status>ok</Status><Result><Creator><CreatorID>1970</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/1970</CreatorUrl></Creator><Creator><CreatorID>8126</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-1930</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/8126</CreatorUrl></Creator></Result></Response>"
```


json format


```r
bhl_authorsearch(name = "dimmock", format = "json", output = "raw")
```

```
## [1] "{\"Status\":\"ok\",\"ErrorMessage\":null,\"Result\":[{\"CreatorID\":1970,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Dates\":\"1852-\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/1970\"},{\"CreatorID\":8126,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Dates\":\"1852-1930\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/8126\"}]}"
```


Or get a list. The default output is a list, and if you set `format='xml'` and `output='list'`, then format is forced to equal 'json' as parsing to a list is more straightforward using json.


```r
bhl_authorsearch(name = "dimmock", format = "xml", output = "list")
```

```
## $Status
## [1] "ok"
## 
## $ErrorMessage
## NULL
## 
## $Result
## $Result[[1]]
## $Result[[1]]$CreatorID
## [1] 1970
## 
## $Result[[1]]$Name
## [1] "Dimmock, George,"
## 
## $Result[[1]]$Role
## NULL
## 
## $Result[[1]]$Numeration
## [1] ""
## 
## $Result[[1]]$Unit
## [1] ""
## 
## $Result[[1]]$Title
## [1] ""
## 
## $Result[[1]]$Location
## [1] ""
## 
## $Result[[1]]$FullerForm
## [1] ""
## 
## $Result[[1]]$Dates
## [1] "1852-"
## 
## $Result[[1]]$CreatorUrl
## [1] "http://www.biodiversitylibrary.org/creator/1970"
## 
## 
## $Result[[2]]
## $Result[[2]]$CreatorID
## [1] 8126
## 
## $Result[[2]]$Name
## [1] "Dimmock, George,"
## 
## $Result[[2]]$Role
## NULL
## 
## $Result[[2]]$Numeration
## [1] ""
## 
## $Result[[2]]$Unit
## [1] ""
## 
## $Result[[2]]$Title
## [1] ""
## 
## $Result[[2]]$Location
## [1] ""
## 
## $Result[[2]]$FullerForm
## [1] ""
## 
## $Result[[2]]$Dates
## [1] "1852-1930"
## 
## $Result[[2]]$CreatorUrl
## [1] "http://www.biodiversitylibrary.org/creator/8126"
```


Is the same output as all default options


```r
bhl_authorsearch(name = "dimmock")
```

```
## $Status
## [1] "ok"
## 
## $ErrorMessage
## NULL
## 
## $Result
## $Result[[1]]
## $Result[[1]]$CreatorID
## [1] 1970
## 
## $Result[[1]]$Name
## [1] "Dimmock, George,"
## 
## $Result[[1]]$Role
## NULL
## 
## $Result[[1]]$Numeration
## [1] ""
## 
## $Result[[1]]$Unit
## [1] ""
## 
## $Result[[1]]$Title
## [1] ""
## 
## $Result[[1]]$Location
## [1] ""
## 
## $Result[[1]]$FullerForm
## [1] ""
## 
## $Result[[1]]$Dates
## [1] "1852-"
## 
## $Result[[1]]$CreatorUrl
## [1] "http://www.biodiversitylibrary.org/creator/1970"
## 
## 
## $Result[[2]]
## $Result[[2]]$CreatorID
## [1] 8126
## 
## $Result[[2]]$Name
## [1] "Dimmock, George,"
## 
## $Result[[2]]$Role
## NULL
## 
## $Result[[2]]$Numeration
## [1] ""
## 
## $Result[[2]]$Unit
## [1] ""
## 
## $Result[[2]]$Title
## [1] ""
## 
## $Result[[2]]$Location
## [1] ""
## 
## $Result[[2]]$FullerForm
## [1] ""
## 
## $Result[[2]]$Dates
## [1] "1852-1930"
## 
## $Result[[2]]$CreatorUrl
## [1] "http://www.biodiversitylibrary.org/creator/8126"
```


### Some examples of function calls

#### Get title metadata


```r
bhl_gettitlemetadata(1726, TRUE)
```

```
## $Status
## [1] "ok"
## 
## $ErrorMessage
## NULL
## 
## $Result
## $Result$TitleID
## [1] 1726
## 
## $Result$BibliographicLevel
## [1] "Monograph/Item"
## 
## $Result$FullTitle
## [1] "The anatomy of the mouth-parts and of the sucking apparatus of some Diptera.  "
## 
## $Result$ShortTitle
## [1] "The anatomy of the mouth-parts and of the sucking apparatus of some Diptera."
## 
## $Result$SortTitle
## [1] "anatomy of the mouth-parts and of the sucking apparatus of"
## 
## $Result$PartNumber
## NULL
## 
## $Result$PartName
## NULL
## 
## $Result$CallNumber
## [1] "QL538 .D58"
## 
## $Result$Edition
## NULL
## 
## $Result$PublisherPlace
## [1] "Boston,"
## 
## $Result$PublisherName
## [1] "A. Williams & co.,"
## 
## $Result$PublicationDate
## [1] "1881."
## 
## $Result$PublicationFrequency
## NULL
## 
## $Result$Doi
## [1] "10.5962/bhl.title.1726"
## 
## $Result$TitleUrl
## [1] "http://www.biodiversitylibrary.org/bibliography/1726"
## 
## $Result$Authors
## $Result$Authors[[1]]
## $Result$Authors[[1]]$CreatorID
## [1] 1970
## 
## $Result$Authors[[1]]$Name
## [1] "Dimmock, George,"
## 
## $Result$Authors[[1]]$Role
## [1] "Main Entry -- Personal Name (MARC 100)"
## 
## $Result$Authors[[1]]$Numeration
## [1] ""
## 
## $Result$Authors[[1]]$Unit
## [1] ""
## 
## $Result$Authors[[1]]$Title
## [1] ""
## 
## $Result$Authors[[1]]$Location
## [1] ""
## 
## $Result$Authors[[1]]$FullerForm
## [1] ""
## 
## $Result$Authors[[1]]$Dates
## [1] "1852-"
## 
## $Result$Authors[[1]]$CreatorUrl
## NULL
## 
## 
## 
## $Result$Subjects
## $Result$Subjects[[1]]
## SubjectText 
##   "Diptera" 
## 
## 
## $Result$Identifiers
## $Result$Identifiers[[1]]
##  IdentifierName IdentifierValue 
##           "DLC"      "08023002" 
## 
## $Result$Identifiers[[2]]
##  IdentifierName IdentifierValue 
##       "MARC001"          "1223" 
## 
## $Result$Identifiers[[3]]
##  IdentifierName IdentifierValue 
##          "OCLC"       "2992225" 
## 
## 
## $Result$Collections
## NULL
## 
## $Result$Variants
## list()
## 
## $Result$Items
## $Result$Items[[1]]
## $Result$Items[[1]]$ItemID
## [1] 16800
## 
## $Result$Items[[1]]$PrimaryTitleID
## [1] 1726
## 
## $Result$Items[[1]]$ThumbnailPageID
## [1] 1328691
## 
## $Result$Items[[1]]$Source
## [1] "Internet Archive"
## 
## $Result$Items[[1]]$SourceIdentifier
## [1] "anatomyofmouthpa00dimm"
## 
## $Result$Items[[1]]$Volume
## [1] ""
## 
## $Result$Items[[1]]$Year
## NULL
## 
## $Result$Items[[1]]$Contributor
## [1] "MBLWHOI Library, Woods Hole"
## 
## $Result$Items[[1]]$Sponsor
## [1] "MBLWHOI Library"
## 
## $Result$Items[[1]]$Language
## [1] "English"
## 
## $Result$Items[[1]]$LicenseUrl
## [1] ""
## 
## $Result$Items[[1]]$Rights
## [1] ""
## 
## $Result$Items[[1]]$DueDiligence
## [1] ""
## 
## $Result$Items[[1]]$CopyrightStatus
## [1] ""
## 
## $Result$Items[[1]]$CopyrightRegion
## [1] ""
## 
## $Result$Items[[1]]$ItemUrl
## [1] "http://www.biodiversitylibrary.org/item/16800"
## 
## $Result$Items[[1]]$TitleUrl
## [1] "http://www.biodiversitylibrary.org/bibliography/1726"
## 
## $Result$Items[[1]]$ItemThumbUrl
## [1] "http://www.biodiversitylibrary.org/pagethumb/1328691"
## 
## $Result$Items[[1]]$Pages
## NULL
## 
## $Result$Items[[1]]$Parts
## NULL
## 
## $Result$Items[[1]]$Collections
## NULL
```


#### Book search


```r
bhl_booksearch(title = "Selborne", lname = "White", volume = 2, edition = "new", 
    year = 1825, collectionid = 4, language = "eng")
```

```
## $Status
## [1] "ok"
## 
## $ErrorMessage
## NULL
## 
## $Result
## $Result[[1]]
## $Result[[1]]$TitleID
## [1] 32868
## 
## $Result[[1]]$BibliographicLevel
## [1] ""
## 
## $Result[[1]]$FullTitle
## [1] "The natural history of Selborne : to which are added the naturalist's calendar, miscellaneous observations, and poems."
## 
## $Result[[1]]$ShortTitle
## NULL
## 
## $Result[[1]]$SortTitle
## NULL
## 
## $Result[[1]]$PartNumber
## [1] ""
## 
## $Result[[1]]$PartName
## [1] ""
## 
## $Result[[1]]$CallNumber
## NULL
## 
## $Result[[1]]$Edition
## [1] "A new ed., with engravings."
## 
## $Result[[1]]$PublisherPlace
## [1] "London"
## 
## $Result[[1]]$PublisherName
## [1] "Printed for C. and J. Rivington [etc.]"
## 
## $Result[[1]]$PublicationDate
## [1] "1825"
## 
## $Result[[1]]$PublicationFrequency
## NULL
## 
## $Result[[1]]$Doi
## NULL
## 
## $Result[[1]]$TitleUrl
## [1] "http://www.biodiversitylibrary.org/bibliography/32868"
## 
## $Result[[1]]$Authors
## $Result[[1]]$Authors[[1]]
## $Result[[1]]$Authors[[1]]$CreatorID
## [1] 9572
## 
## $Result[[1]]$Authors[[1]]$Name
## [1] "White, Gilbert,"
## 
## $Result[[1]]$Authors[[1]]$Role
## [1] "Main Entry -- Personal Name (MARC 100)"
## 
## $Result[[1]]$Authors[[1]]$Numeration
## [1] ""
## 
## $Result[[1]]$Authors[[1]]$Unit
## [1] ""
## 
## $Result[[1]]$Authors[[1]]$Title
## [1] ""
## 
## $Result[[1]]$Authors[[1]]$Location
## [1] ""
## 
## $Result[[1]]$Authors[[1]]$FullerForm
## [1] ""
## 
## $Result[[1]]$Authors[[1]]$Dates
## [1] "1720-1793"
## 
## $Result[[1]]$Authors[[1]]$CreatorUrl
## NULL
## 
## 
## 
## $Result[[1]]$Subjects
## NULL
## 
## $Result[[1]]$Identifiers
## NULL
## 
## $Result[[1]]$Collections
## NULL
## 
## $Result[[1]]$Variants
## NULL
## 
## $Result[[1]]$Items
## $Result[[1]]$Items[[1]]
## $Result[[1]]$Items[[1]]$ItemID
## [1] 77247
## 
## $Result[[1]]$Items[[1]]$PrimaryTitleID
## NULL
## 
## $Result[[1]]$Items[[1]]$ThumbnailPageID
## NULL
## 
## $Result[[1]]$Items[[1]]$Source
## NULL
## 
## $Result[[1]]$Items[[1]]$SourceIdentifier
## NULL
## 
## $Result[[1]]$Items[[1]]$Volume
## [1] "1"
## 
## $Result[[1]]$Items[[1]]$Year
## NULL
## 
## $Result[[1]]$Items[[1]]$Contributor
## [1] "Gerstein - University of Toronto (archive.org)"
## 
## $Result[[1]]$Items[[1]]$Sponsor
## NULL
## 
## $Result[[1]]$Items[[1]]$Language
## NULL
## 
## $Result[[1]]$Items[[1]]$LicenseUrl
## NULL
## 
## $Result[[1]]$Items[[1]]$Rights
## NULL
## 
## $Result[[1]]$Items[[1]]$DueDiligence
## NULL
## 
## $Result[[1]]$Items[[1]]$CopyrightStatus
## NULL
## 
## $Result[[1]]$Items[[1]]$CopyrightRegion
## NULL
## 
## $Result[[1]]$Items[[1]]$ItemUrl
## [1] "http://www.biodiversitylibrary.org/item/77247"
## 
## $Result[[1]]$Items[[1]]$TitleUrl
## NULL
## 
## $Result[[1]]$Items[[1]]$ItemThumbUrl
## NULL
## 
## $Result[[1]]$Items[[1]]$Pages
## NULL
## 
## $Result[[1]]$Items[[1]]$Parts
## NULL
## 
## $Result[[1]]$Items[[1]]$Collections
## $Result[[1]]$Items[[1]]$Collections[[1]]
## $Result[[1]]$Items[[1]]$Collections[[1]]$CollectionID
## [1] 4
## 
## $Result[[1]]$Items[[1]]$Collections[[1]]$CollectionName
## [1] "Charles Darwin's Library"
## 
## $Result[[1]]$Items[[1]]$Collections[[1]]$CollectionDescription
## NULL
## 
## $Result[[1]]$Items[[1]]$Collections[[1]]$CanContainTitles
## NULL
## 
## $Result[[1]]$Items[[1]]$Collections[[1]]$CanContainItems
## NULL
## 
## 
## 
## 
## $Result[[1]]$Items[[2]]
## $Result[[1]]$Items[[2]]$ItemID
## [1] 71924
## 
## $Result[[1]]$Items[[2]]$PrimaryTitleID
## NULL
## 
## $Result[[1]]$Items[[2]]$ThumbnailPageID
## NULL
## 
## $Result[[1]]$Items[[2]]$Source
## NULL
## 
## $Result[[1]]$Items[[2]]$SourceIdentifier
## NULL
## 
## $Result[[1]]$Items[[2]]$Volume
## [1] "2"
## 
## $Result[[1]]$Items[[2]]$Year
## NULL
## 
## $Result[[1]]$Items[[2]]$Contributor
## [1] "Gerstein - University of Toronto (archive.org)"
## 
## $Result[[1]]$Items[[2]]$Sponsor
## NULL
## 
## $Result[[1]]$Items[[2]]$Language
## NULL
## 
## $Result[[1]]$Items[[2]]$LicenseUrl
## NULL
## 
## $Result[[1]]$Items[[2]]$Rights
## NULL
## 
## $Result[[1]]$Items[[2]]$DueDiligence
## NULL
## 
## $Result[[1]]$Items[[2]]$CopyrightStatus
## NULL
## 
## $Result[[1]]$Items[[2]]$CopyrightRegion
## NULL
## 
## $Result[[1]]$Items[[2]]$ItemUrl
## [1] "http://www.biodiversitylibrary.org/item/71924"
## 
## $Result[[1]]$Items[[2]]$TitleUrl
## NULL
## 
## $Result[[1]]$Items[[2]]$ItemThumbUrl
## NULL
## 
## $Result[[1]]$Items[[2]]$Pages
## NULL
## 
## $Result[[1]]$Items[[2]]$Parts
## NULL
## 
## $Result[[1]]$Items[[2]]$Collections
## $Result[[1]]$Items[[2]]$Collections[[1]]
## $Result[[1]]$Items[[2]]$Collections[[1]]$CollectionID
## [1] 4
## 
## $Result[[1]]$Items[[2]]$Collections[[1]]$CollectionName
## [1] "Charles Darwin's Library"
## 
## $Result[[1]]$Items[[2]]$Collections[[1]]$CollectionDescription
## NULL
## 
## $Result[[1]]$Items[[2]]$Collections[[1]]$CanContainTitles
## NULL
## 
## $Result[[1]]$Items[[2]]$Collections[[1]]$CanContainItems
## NULL
```


#### Search titles


```r
bhl_titlesearchsimple("husbandry")$Result[[1]]
```

```
## $TitleID
## [1] 25997
## 
## $BibliographicLevel
## [1] "Monograph/Item"
## 
## $FullTitle
## [1] "An account of the systems of husbandry adopted in the more improved districts of Scotland ...  "
## 
## $ShortTitle
## [1] "An account of the systems of husbandry adopted in the more improved districts of Scotland ..."
## 
## $SortTitle
## [1] "account of the systems of husbandry adopted in the more imp"
## 
## $PartNumber
## NULL
## 
## $PartName
## NULL
## 
## $CallNumber
## NULL
## 
## $Edition
## [1] "2d ed. "
## 
## $PublisherPlace
## [1] "Edinburgh :"
## 
## $PublisherName
## [1] "A. Constable,"
## 
## $PublicationDate
## [1] "1813."
## 
## $PublicationFrequency
## NULL
## 
## $Doi
## NULL
## 
## $TitleUrl
## NULL
## 
## $Authors
## NULL
## 
## $Subjects
## NULL
## 
## $Identifiers
## NULL
## 
## $Collections
## NULL
## 
## $Variants
## NULL
## 
## $Items
## NULL
```


#### Get languages

This function gets a list of languages in which materials in BHL have been written.  This is also an example of a function that actually gives a `data.frame` when `output='parsed'`.


```r
out <- bhl_getlanguages(output = "parsed")
head(out)
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

