<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{rbhl vignette}
%\VignetteEncoding{UTF-8}
-->



rbhl Introduction
=================

`rbhl` is an R interface to the Biodiversity Heritage Library.

## Installation

Stable version from CRAN


```r
install.packages("rbhl")
```

Or, development version from GitHub


```r
devtools::install_github("ropensci/rbhl")
```

Then load library


```r
library("rbhl")
```

## Output formats

You can output various formats using the `as` parameter, setting to 'json', 'xml', 'list', or 'table'. Note that not all options are available in all functions due to varying returned data objects.

Raw output, in xml format


```r
bhl_authorsearch(name='dimmock', as='xml')
```

json format


```r
bhl_authorsearch(name='dimmock', as='json')
```

```
#> [1] "{\"Status\":\"ok\",\"ErrorMessage\":null,\"Result\":[{\"CreatorID\":189035,\"Name\":\"Dimmock, Anna Katherina\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/189035\"},{\"CreatorID\":59023,\"Name\":\"Dimmock, G\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/59023\"},{\"CreatorID\":189042,\"Name\":\"Dimmock, Geo \",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/189042\"},{\"CreatorID\":189021,\"Name\":\"Dimmock, George\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/189021\"},{\"CreatorID\":1970,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"1852-\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/1970\"},{\"CreatorID\":8126,\"Name\":\"Dimmock, George,\",\"Role\":null,\"Numeration\":\"\",\"Unit\":\"\",\"Title\":\"\",\"Location\":\"\",\"FullerForm\":\"\",\"Relationship\":null,\"TitleOfWork\":null,\"Dates\":\"1852-1930\",\"CreatorUrl\":\"http://www.biodiversitylibrary.org/creator/8126\"}]}"
```

Or get a list


```r
bhl_authorsearch(name='dimmock', as='list')
```

```
#> $Status
#> [1] "ok"
#> 
#> $ErrorMessage
#> NULL
#> 
#> $Result
#> $Result[[1]]
#> $Result[[1]]$CreatorID
#> [1] 189035
...
```

The default option in most functions is to parse to a data.frame


```r
bhl_authorsearch(name='dimmock')
```

```
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

## Some examples of function calls

### Get title metadata


```r
bhl_gettitlemetadata(1726, items = TRUE)
```

```
#> $Status
#> [1] "ok"
#> 
#> $ErrorMessage
#> NULL
#> 
#> $Result
#> $Result$TitleID
#> [1] 1726
#> 
...
```

### Book search


```r
bhl_booksearch(title='Selborne', lname='White', volume=2, edition='new', year=1825, collectionid=4, language='eng')
```

```
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

### Search titles


```r
bhl_titlesearchsimple('husbandry')
```

```
#> # A tibble: 154 × 22
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
#> # ... with 144 more rows, and 20 more variables: FullTitle <chr>,
#> #   ShortTitle <chr>, SortTitle <chr>, PartNumber <chr>, PartName <chr>,
#> #   CallNumber <lgl>, Edition <chr>, PublisherPlace <chr>,
#> #   PublisherName <chr>, PublicationDate <chr>,
#> #   PublicationFrequency <chr>, Doi <lgl>, TitleUrl <lgl>, Authors <lgl>,
#> #   Subjects <lgl>, Identifiers <lgl>, Collections <lgl>, Variants <lgl>,
#> #   Items <lgl>, Notes <lgl>
```

### Get languages

This function gets a list of languages in which materials in BHL have been written. 


```r
bhl_getlanguages()
```

```
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

## Use case for BHL data

Here, we'll xxx, then plot the data using `ggplot2`


```r
res <- bhl_booksearch(title = 'Selborne', lname = 'White', volume = 2, edition = 'new', year = 1825, collectionid = 4, language = 'eng')
pages <- getpages(res$data$Items[[1]]$ItemID)
```

Remove `NULL`'s


```r
pages <- Filter(function(x) !is.null(x), pages)
```

Cleanup text


```r
pages_clean <- lapply(pages, function(x) gsub("\n", "", x))
```

Examine pages


```r
pages_clean[10:12]
```

```
#> [[1]]
#> [1] "OF SELBORNE. 3, The sternum in this bird seemed to us to  be remarkably short, between which and  the anus lay the crop, or craw, and, imme-  diately behind that, the bowels against the  back-bone. It must be allowed, as this anatomist  observes, that the crop placed just upon the  bowels must, especially when full, be in a  very uneasy situation during the business of  incubation ; yet the test will be, to examine  whether birds that are actually known to  sit for certain are not formed in a similar  manner. This inquiry I proposed to my-  self to make with di fern-owl, or goat-sucker,  as soon as opportunity offered : because if  their formation proves the same, the reason  for incapacity in the cuckoo will be allowed  to have been taken up somewhat hastily. Not long after a fern-owl was procured,  which, from its habit and shape, we sus-  pected might resemble the cuckoo in its  internal construction. Nor were our sus-  picions ill-grounded ; for, upon the dissec-  tion, the crop, or craw, also lay behind the  sternum, immediately on the viscera, be-  . b2 "
#> 
#> [[2]]
#> [1] "4 NATURAL HISTORY tween them and the skin ©f the belly.  It was bulky, and stuffed hard with large  phalcBTKB, moths of several sorts, and their  eggs, which, no doubt, had been forced out  of those insects by the action of swal-  lowing. Now, as it appears that this bird, which  is so well known to practise incubation, is  formed in a similar manner with cuckoos^  Monsieur Herissant's conjecture, that cuc-  koos are incapable of incubation from the  disposition of their intestines, seems to fall  to the ground : and we are still at a loss  for the cause of that strange and singular  peculiarity in the instance of the cuculus  canorus. We found the case to be the same with  the ring-tail hawk, in respect to formation ;  and, as far as I can recollect, with the  swift; and probably it is so with many  more sorts of birds that are not grani-  vorous. I am, &c. "
#> 
#> [[3]]
#> [1] "OF SELBORNE. ,5 Letter xxxl TO THE SAME,  • DEAR SIR; Selborne, April 29, 1776. On August the 4th, 1775, we surprised  a large viper, which seemed very heavy  and bloated, as it lay in the grass basking  in the sun. When we came to cut it up,  we found that the abdomen was crowded  with young, fifteen in number ; the shortest  of which measured full seven inches, and  were about the size of full-grown earth-  worms. This little fry issued into the  world with the true viper spirit about them,  showing great alertness as soon as disen-  gaged from the belly of the dam : they  twisted and riggled about, and set them-  selves up, and gaped very wide when  touched with a stick, showing manifest  tokens of menace and defiance, though as "
```

With this text data, you can do text mining of the content to answer cool questions you have. 
