# rbhl #

This is an R interface to the Biodiversity Heritage Library API. 

Get your Biodiversity Heritage Library API key [here](http://www.biodiversitylibrary.org/getapikey.aspx)

Put your API in your .Rprofile file using e.g., `options(BioHerLibKey = "YOURBHLAPIKEY")`, and the functions within this package will be able to use your API key without you having to enter it every time you run a search. 

Biodiversity Heritage Library API documentation [here](http://www.biodiversitylibrary.org/api2/docs/docs.html).

Biodiversity Heritage Library OpenURL documentation [here](http://www.biodiversitylibrary.org/openurlhelp.aspx).

`rbhl` is part of the rOpenSci project, visit http://ropensci.org to learn more.

# Install `rbhl` from GitHub:

```R
install.packages("devtools")
require(devtools)
install_github("rbhl", "ropensci")
require(rbhl)
```