rbhl
====

[![Build Status](https://api.travis-ci.org/ropensci/rbhl.png)](https://travis-ci.org/ropensci/rbhl)

`rbhl` is an R interface to the Biodiversity Heritage Library API. 

## Info

Authentication:

* Get your Biodiversity Heritage Library API key [here](http://www.biodiversitylibrary.org/getapikey.aspx)
* Put your API in your .Rprofile file using e.g., `options(BioHerLibKey = "YOURBHLAPIKEY")`, and the functions within this package will be able to use your API key without you having to enter it every time you run a search. 

Documentation:

* Biodiversity Heritage Library API documentation [here](http://www.biodiversitylibrary.org/api2/docs/docs.html).
* Biodiversity Heritage Library OpenURL documentation [here](http://www.biodiversitylibrary.org/openurlhelp.aspx).

## Quickstart

### Install `rbhl` from GitHub:

```R
install.packages("devtools")
require(devtools)
install_github("rbhl", "ropensci")
require(rbhl)
```

### Output formats

You can output various formats using the `format` parameter, setting to 'json' or 'xml'. Use in combination with `output` to get a `list`, `raw` data (json or xml, set via `format`), or `parsed` data. The parsed option will eventually attempt to coerce data to a data.frame to ease consumption of data, but most functions currently return a list when `output=parsed`.

Raw output, in xml format

```coffee
bhl_authorsearch(name='dimmock', format='xml', output="raw")
```

```coffee
[1] "﻿<?xml version=\"1.0\" encoding=\"utf-8\"?><Response xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><Status>ok</Status><Result><Creator><CreatorID>1970</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/1970</CreatorUrl></Creator><Creator><CreatorID>8126</CreatorID><Name>Dimmock, George,</Name><Numeration /><Unit /><Title /><Location /><FullerForm /><Dates>1852-1930</Dates><CreatorUrl>http://www.biodiversitylibrary.org/creator/8126</CreatorUrl></Creator></Result></Response>"
```

json format

```coffee
bhl_authorsearch(name='dimmock', format='json', output="raw")
```

```coffee
[1] "{\"Status\":\"ok\",\"ErrorMessage\":null,\"Result\":[{\"CreatorID\":1970,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Dates\":\"1852-\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/1970\"},{\"CreatorID\":8126,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Dates\":\"1852-1930\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/8126\"}]}"
```

Or get a list. The default output is a list, and if you set `format='xml'` and `output='list'`, then format is forced to equal 'json' as parsing to a list is more straightforward using json.

```coffee
bhl_authorsearch(name='dimmock', format='xml', output="list")
``` 

```coffee
$Status
[1] "ok"

$ErrorMessage
NULL

$Result
$Result[[1]]
$Result[[1]]$CreatorID
[1] 1970

$Result[[1]]$Name
[1] "Dimmock, George,"

$Result[[1]]$Role
NULL
``` 

Is the same output as all default options

```coffee
bhl_authorsearch(name='dimmock')
``` 

```coffee
$Status
[1] "ok"

$ErrorMessage
NULL

$Result
$Result[[1]]
$Result[[1]]$CreatorID
[1] 1970

$Result[[1]]$Name
[1] "Dimmock, George,"

$Result[[1]]$Role
NULL

[... cutoff]
``` 

### Some examples of function calls

#### Get title metadata

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

[... cutoff]
```

#### Book search

```coffee
bhl_booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825, collectionid=4, language='eng')
```

```coffee
$Status
[1] "ok"

$ErrorMessage
NULL

$Result
$Result[[1]]
$Result[[1]]$TitleID
[1] 32868

$Result[[1]]$BibliographicLevel
[1] ""

$Result[[1]]$FullTitle
[1] "The natural history of Selborne : to which are added the naturalist's calendar, miscellaneous observations, and poems."

[... cutoff]
```

#### 

```coffee
bhl_titlesearchsimple('husbandry')$Result[[1]]
```

```coffee
$TitleID
[1] 25997

$BibliographicLevel
[1] "Monograph/Item"

$FullTitle
[1] "An account of the systems of husbandry adopted in the more improved districts of Scotland ...  "

$ShortTitle
[1] "An account of the systems of husbandry adopted in the more improved districts of Scotland ..."

$SortTitle
[1] "account of the systems of husbandry adopted in the more imp"

[... cutoff]
```

#### Get languages

This function gets a list of languages in which materials in BHL have been written.  This is also an example of a function that actually gives a `data.frame` when `output='parsed'`.

```coffee
out <- bhl_getlanguages(output='parsed')
head(out)
```

```coffee
  LanguageCode LanguageName
1          AFR    Afrikaans
2          ARA       Arabic
3          ARC      Aramaic
4          BUL    Bulgarian
5          BUR      Burmese
6          CAR        Carib
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