rbhl
====



[![cran checks](https://cranchecks.info/badges/worst/rbhl)](https://cranchecks.info/pkgs/rbhl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-check](https://github.com/ropensci/rbhl/workflows/R-check/badge.svg)](https://github.com/ropensci/rbhl/actions?query=workflow%3AR-check)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rbhl?color=2ECC71)](https://github.com/r-hub/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rbhl)](https://cran.r-project.org/package=rbhl)
[![codecov.io](https://codecov.io/github/ropensci/rbhl/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rbhl?branch=master)

`rbhl` is an R interface to the Biodiversity Heritage Library API.

## Info

Authentication:

* Get your Biodiversity Heritage Library API key at <https://www.biodiversitylibrary.org/getapikey.aspx>
* Put your API key either in your .Renviron file (or similar) with the name `BHL_KEY`, or your .Rprofile file with the name `bhl_key`, and we'll use your API key without you having to enter it every time you run a search.

Documentation:

* Biodiversity Heritage Library API documentation at <https://www.biodiversitylibrary.org/docs/api3.html>
* Biodiversity Heritage Library OpenURL documentation at <https://www.biodiversitylibrary.org/openurlhelp.aspx>

## Installation

Stable version


```r
install.packages("rbhl")
```

Development version


```r
remotes::install_github("ropensci/rbhl")
```


```r
library("rbhl")
```

## Output formats

You can output various formats using the `as` parameter, setting to `table`, `list`, `json` or `xml`.

The default is usually `table`:


```r
bhl_authorsearch(name='dimmock')
#> # A tibble: 6 x 4
#>   AuthorID Name                 CreatorUrl                               Dates  
#>   <chr>    <chr>                <chr>                                    <chr>  
#> 1 189035   "Dimmock, Anna Kath… https://www.biodiversitylibrary.org/cre… <NA>   
#> 2 59023    "Dimmock, G"         https://www.biodiversitylibrary.org/cre… <NA>   
#> 3 189042   "Dimmock, Geo "      https://www.biodiversitylibrary.org/cre… <NA>   
#> 4 189021   "Dimmock, George"    https://www.biodiversitylibrary.org/cre… <NA>   
#> 5 1970     "Dimmock, George,"   https://www.biodiversitylibrary.org/cre… 1852-  
#> 6 8126     "Dimmock, George,"   https://www.biodiversitylibrary.org/cre… 1852-1…
```

list output


```r
bhl_authorsearch(name='dimmock', as='list')$Result[[1]]
#> $AuthorID
#> [1] "189035"
#> 
#> $Name
#> [1] "Dimmock, Anna Katherina"
#> 
#> $CreatorUrl
#> [1] "https://www.biodiversitylibrary.org/creator/189035"
```

XML output


```r
bhl_authorsearch(name='dimmock', as='xml')
#> [1] "﻿<?xml version=\"1.0\" encoding=\"utf-8\"?><Response xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><Status>ok</Status><ErrorMessage /><Result><Author><AuthorID>189035</AuthorID><Name>Dimmock, Anna Katherina</Name><CreatorUrl>https://www.biodiversitylibrary.org/creator/189035</CreatorUrl></Author><Author><AuthorID>59023</AuthorID><Name>Dimmock, G</Name><CreatorUrl>https://www.biodiversitylibrary.org/creator/59023</CreatorUrl></Author><Author><AuthorID>189042</AuthorID><Name>Dimmock, Geo </Name><CreatorUrl>https://www.biodiversitylibrary.org/creator/189042</CreatorUrl></Author><Author><AuthorID>189021</AuthorID><Name>Dimmock, George</Name><CreatorUrl>https://www.biodiversitylibrary.org/creator/189021</CreatorUrl></Author><Author><AuthorID>1970</AuthorID><Name>Dimmock, George,</Name><Dates>1852-</Dates><CreatorUrl>https://www.biodiversitylibrary.org/creator/1970</CreatorUrl></Author><Author><AuthorID>8126</AuthorID><Name>Dimmock, George,</Name><Dates>1852-1930</Dates><CreatorUrl>https://www.biodiversitylibrary.org/creator/8126</CreatorUrl></Author></Result></Response>"
```

JSON output


```r
bhl_authorsearch(name='dimmock', as='json')
#> [1] "{\"Status\":\"ok\",\"ErrorMessage\":\"\",\"Result\":[{\"AuthorID\":\"189035\",\"Name\":\"Dimmock, Anna Katherina\",\"CreatorUrl\":\"https://www.biodiversitylibrary.org/creator/189035\"},{\"AuthorID\":\"59023\",\"Name\":\"Dimmock, G\",\"CreatorUrl\":\"https://www.biodiversitylibrary.org/creator/59023\"},{\"AuthorID\":\"189042\",\"Name\":\"Dimmock, Geo \",\"CreatorUrl\":\"https://www.biodiversitylibrary.org/creator/189042\"},{\"AuthorID\":\"189021\",\"Name\":\"Dimmock, George\",\"CreatorUrl\":\"https://www.biodiversitylibrary.org/creator/189021\"},{\"AuthorID\":\"1970\",\"Name\":\"Dimmock, George,\",\"Dates\":\"1852-\",\"CreatorUrl\":\"https://www.biodiversitylibrary.org/creator/1970\"},{\"AuthorID\":\"8126\",\"Name\":\"Dimmock, George,\",\"Dates\":\"1852-1930\",\"CreatorUrl\":\"https://www.biodiversitylibrary.org/creator/8126\"}]}"
```

## Get title metadata


```r
bhl_gettitlemetadata(1726, items = TRUE, as = "list")$Result[[1]]$Items
#> [[1]]
#> [[1]]$ItemID
#> [1] 16800
#> 
#> [[1]]$ItemUrl
#> [1] "https://www.biodiversitylibrary.org/item/16800"
```

## Book search


```r
bhl_publicationsearch('cocos island costa rica birds')
#> # A tibble: 2 x 17
#>   BHLType FoundIn  Volume Authors  PartUrl  PartID Genre Title   ContainerTitle 
#>   <chr>   <chr>    <chr>  <list>   <chr>    <chr>  <chr> <chr>   <chr>          
#> 1 Part    Metadata 2      <df[,1]… https:/… 69838  Arti… Field … Proceedings of…
#> 2 Item    Metadata <NA>   <df[,1]… <NA>     <NA>   Book  The bi… <NA>           
#> # … with 8 more variables: Series <chr>, Date <chr>, PageRange <chr>,
#> #   ItemID <chr>, TitleID <chr>, ExternalUrl <chr>, ItemUrl <chr>,
#> #   TitleUrl <chr>
```

## Get languages


```r
bhl_getlanguages()
#> # A tibble: 80 x 2
#>    LanguageCode LanguageName        
#>    <chr>        <chr>               
#>  1 AFR          Afrikaans           
#>  2 ARA          Arabic              
#>  3 ARC          Aramaic             
#>  4 MAP          Austronesian (Other)
#>  5 BUL          Bulgarian           
#>  6 BUR          Burmese             
#>  7 CAR          Carib               
#>  8 CAT          Catalan             
#>  9 CEL          Celtic (Other)      
#> 10 CHI          Chinese             
#> # … with 70 more rows
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rbhl/issues).
* License: MIT
* Get citation information for `rbhl` in R doing `citation(package = 'rbhl')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.
