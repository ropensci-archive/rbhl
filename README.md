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