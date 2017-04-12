rbhl
====



[![Build Status](https://api.travis-ci.org/ropensci/rbhl.png)](https://travis-ci.org/ropensci/rbhl)
[![Build status](https://ci.appveyor.com/api/projects/status/ej5u9mdirg1yyteg/branch/master)](https://ci.appveyor.com/project/sckott/rbhl/branch/master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/rbhl?color=2ECC71)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/rbhl)](https://cran.r-project.org/package=rbhl)
[![codecov.io](https://codecov.io/github/ropensci/rbhl/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rbhl?branch=master)

`rbhl` is an R interface to the Biodiversity Heritage Library API.

## Info

Authentication:

* Get your Biodiversity Heritage Library API key [here](http://www.biodiversitylibrary.org/getapikey.aspx)
* Put your API in your .Rprofile file using e.g., `options(BioHerLibKey = "YOURBHLAPIKEY")`, and the functions within this package will be able to use your API key without you having to enter it every time you run a search.

Documentation:

* Biodiversity Heritage Library API documentation [here](http://www.biodiversitylibrary.org/api2/docs/docs.html).
* Biodiversity Heritage Library OpenURL documentation [here](http://www.biodiversitylibrary.org/openurlhelp.aspx).

## Installation

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

## Output formats

You can output various formats using the `as` parameter, setting to `table`, `list`, `json` or `xml`.

The default is usually `table`:


```r
bhl_authorsearch(name='dimmock')
#> # A tibble: 6 × 12
#>   CreatorID                    Name  Role Numeration  Unit Title Location
#> *     <int>                   <chr> <lgl>      <chr> <chr> <chr>    <chr>
#> 1    189035 Dimmock, Anna Katherina    NA                                
#> 2     59023              Dimmock, G    NA                                
#> 3    189042           Dimmock, Geo     NA                                
#> 4    189021         Dimmock, George    NA                                
#> 5      1970        Dimmock, George,    NA                                
#> 6      8126        Dimmock, George,    NA                                
#> # ... with 5 more variables: FullerForm <chr>, Relationship <lgl>,
#> #   TitleOfWork <lgl>, Dates <chr>, CreatorUrl <chr>
```

list output


```r
bhl_authorsearch(name='dimmock', as='list')$Result[[1]]
#> $CreatorID
#> [1] 189035
#> 
#> $Name
#> [1] "Dimmock, Anna Katherina"
#> 
#> $Role
#> NULL
#> 
#> $Numeration
#> [1] ""
#> 
#> $Unit
#> [1] ""
#> 
#> $Title
#> [1] ""
#> 
#> $Location
#> [1] ""
#> 
#> $FullerForm
#> [1] ""
#> 
#> $Relationship
#> NULL
#> 
#> $TitleOfWork
#> NULL
#> 
#> $Dates
#> [1] ""
#> 
#> $CreatorUrl
#> [1] "http://www.biodiversitylibrary.org/creator/189035"
```

XML output


```r
bhl_authorsearch(name='dimmock', as='xml')
#> [1] "﻿<?xml version=\"1.0\" encoding=\"utf-8\"?><Response xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><Status>ok</Status><Result><Creator><CreatorID>189035</CreatorID><Name>Dimmock, Anna Katherina</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates /><CreatorUrl>http://www.biodiversitylibrary.org/creator/189035</CreatorUrl></Creator><Creator><CreatorID>59023</CreatorID><Name>Dimmock, G</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates /><CreatorUrl>http://www.biodiversitylibrary.org/creator/59023</CreatorUrl></Creator><Creator><CreatorID>189042</CreatorID><Name>Dimmock, Geo </Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates /><CreatorUrl>http://www.biodiversitylibrary.org/creator/189042</CreatorUrl></Creator><Creator><CreatorID>189021</CreatorID><Name>Dimmock, George</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates /><CreatorUrl>http://www.biodiversitylibrary.org/creator/189021</CreatorUrl></Creator><Creator><CreatorID>1970</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/1970</CreatorUrl></Creator><Creator><CreatorID>8126</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-1930</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/8126</CreatorUrl></Creator></Result></Response>"
```

JSON output


```r
bhl_authorsearch(name='dimmock', as='json')
#> [1] "{\"Status\":\"ok\",\"ErrorMessage\":null,\"Result\":[{\"CreatorID\":189035,\"Name\":\"Dimmock, Anna Katherina\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/189035\"},{\"CreatorID\":59023,\"Name\":\"Dimmock, G\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/59023\"},{\"CreatorID\":189042,\"Name\":\"Dimmock, Geo \",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/189042\"},{\"CreatorID\":189021,\"Name\":\"Dimmock, George\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/189021\"},{\"CreatorID\":1970,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"1852-\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/1970\"},{\"CreatorID\":8126,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"1852-1930\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/8126\"}]}"
```

## Get title metadata


```r
bhl_gettitlemetadata(titleid = 1726, items = TRUE, as="list")$Result$Items
#> [[1]]
#> [[1]]$ItemID
#> [1] 16800
#> 
#> [[1]]$PrimaryTitleID
#> [1] 1726
#> 
#> [[1]]$ThumbnailPageID
#> [1] 1328691
#> 
#> [[1]]$Source
#> [1] "Internet Archive"
#> 
#> [[1]]$SourceIdentifier
#> [1] "anatomyofmouthpa00dimm"
#> 
#> [[1]]$Volume
#> [1] ""
#> 
#> [[1]]$Year
#> NULL
#> 
#> [[1]]$CopySpecificInformation
#> NULL
#> 
#> [[1]]$Contributor
#> [1] "MBLWHOI Library"
#> 
#> [[1]]$RightsHolder
#> NULL
#> 
#> [[1]]$ScanningInstitution
#> NULL
#> 
#> [[1]]$Sponsor
#> [1] "MBLWHOI Library"
#> 
#> [[1]]$Language
#> [1] "English"
#> 
#> [[1]]$LicenseUrl
#> [1] ""
#> 
#> [[1]]$Rights
#> [1] ""
#> 
#> [[1]]$DueDiligence
#> [1] ""
#> 
#> [[1]]$CopyrightStatus
#> [1] "Public domain.  The BHL considers that this work is no longer under copyright protection."
#> 
#> [[1]]$CopyrightRegion
#> [1] ""
#> 
#> [[1]]$ExternalUrl
#> [1] ""
#> 
#> [[1]]$ItemUrl
#> [1] "http://www.biodiversitylibrary.org/item/16800"
#> 
#> [[1]]$TitleUrl
#> [1] "http://www.biodiversitylibrary.org/bibliography/1726"
#> 
#> [[1]]$ItemThumbUrl
#> [1] "http://www.biodiversitylibrary.org/pagethumb/1328691"
#> 
#> [[1]]$Pages
#> NULL
#> 
#> [[1]]$Parts
#> NULL
#> 
#> [[1]]$Collections
#> NULL
```

## Book search


```r
bhl_booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825, collectionid=4, language='eng')
#> # A tibble: 1 × 22
#>   TitleID BibliographicLevel
#> *   <int>              <chr>
#> 1   32868                   
#> # ... with 20 more variables: FullTitle <chr>, ShortTitle <lgl>,
#> #   SortTitle <lgl>, PartNumber <chr>, PartName <chr>, CallNumber <lgl>,
#> #   Edition <chr>, PublisherPlace <chr>, PublisherName <chr>,
#> #   PublicationDate <chr>, PublicationFrequency <lgl>, Doi <lgl>,
#> #   TitleUrl <chr>, Authors <list>, Subjects <lgl>, Identifiers <lgl>,
#> #   Collections <lgl>, Variants <lgl>, Items <list>, Notes <lgl>
```

## Search titles


```r
bhl_titlesearchsimple('husbandry')
#> # A tibble: 153 × 22
#>    TitleID BibliographicLevel
#> *    <int>              <chr>
#> 1    25997     Monograph/Item
#> 2    44403     Monograph/Item
#> 3    27062     Monograph/Item
#> 4    41956     Monograph/Item
#> 5    44462     Monograph/Item
#> 6    28081     Monograph/Item
#> 7    56265     Monograph/Item
#> 8    58205     Monograph/Item
#> 9    51946     Monograph/Item
#> 10   55665     Monograph/Item
#> # ... with 143 more rows, and 20 more variables: FullTitle <chr>,
#> #   ShortTitle <chr>, SortTitle <chr>, PartNumber <chr>, PartName <chr>,
#> #   CallNumber <lgl>, Edition <chr>, PublisherPlace <chr>,
#> #   PublisherName <chr>, PublicationDate <chr>,
#> #   PublicationFrequency <chr>, Doi <lgl>, TitleUrl <lgl>, Authors <lgl>,
#> #   Subjects <lgl>, Identifiers <lgl>, Collections <lgl>, Variants <lgl>,
#> #   Items <lgl>, Notes <lgl>
```

## Get languages


```r
bhl_getlanguages()
#> # A tibble: 69 × 2
#>    LanguageCode         LanguageName
#> *         <chr>                <chr>
#> 1           AFR            Afrikaans
#> 2           ARA               Arabic
#> 3           ARC              Aramaic
#> 4           MAP Austronesian (Other)
#> 5           BUL            Bulgarian
#> 6           BUR              Burmese
#> 7           CAR                Carib
#> 8           CAT              Catalan
#> 9           CEL       Celtic (Other)
#> 10          CHI              Chinese
#> # ... with 59 more rows
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rbhl/issues).
* License: MIT
* Get citation information for `rbhl` in R doing `citation(package = 'rbhl')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![rofooter](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
