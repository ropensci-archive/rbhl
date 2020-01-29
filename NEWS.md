rbhl 0.9.0
===============

### NEW FEATURES

* Re-worked package functions to work with BHL API version 3. Some functions are defunct, see `?rbhl-defunct` after installation. Some BHL API methods were removed and others folded into other API methods; see https://www.biodiversitylibrary.org/docs/api3.html for all the details (#25) (#27)

### MINOR IMPROVEMENTS

* fix missing title in vignette (#26)
* fix instructions for setting a BHL API key (#24)


rbhl 0.8.0
===============

### MINOR IMPROVEMENTS

* moved to markdown docs and tidied docs to 80 line width (#22)
* replaced `httr` with `crul` for http client (#21)
* added many more tests (#2)
* `bhl_getpartendnote()` and `bhl_gettitleendnote` methods removed
due to their removal in the BHL API

rbhl 0.3.0
===============

### NEW FEATURES

* Added code of conduct
* New function `bhl_getinstitutions()` (#16)
* the compact `data.frame` outputs created when `as = "table"` are now
replaced by using `tibble`. in addition, the data.frame used to be
printed as a data.frame, but was actually inside a list accessible by
`x$data` to get to the data.frame. You no longer need to do that. Now
you run a function, and the output is a data.frame (and a `tbl_df`) (#18)
* Now using `xml2` instead of `XML`

### BUG FIXES

* `bhl_getpartnames` was down but it back up now (#17)


rbhl 0.2.0
===============

### NEW FEATURES

* Gains new funtions `bhl_getauthoparts()`, `bhl_getitemparts()`,
`bhl_getpartbibtex()`, `bhl_getpartbyidentifier()`, `bhl_getpartendnote()`,
`bhl_getpartmetadata()`, `bhl_getpartnames()`, `bhl_getsubjectparts()`,
`bhl_getunpublishedparts()`, and `bhl_partsearch()` (#6)
* New function `getpages()` to get multiple OCR pages at once, given
an itemid (#4)

### BUG FIXES

* Import all non-base R functions (#13)
* Fix to README, requested by CRAN, to an image that didn't have an alt
attribute (#8) (#11) (#12)
* Removed arguments in `bhl_getpageocrtext()` for names and ocr that
weren't actually available in the API method. (#3)
* Some functions were missing parameters, and have now been added in where
appropriate. (#5)

rbhl 0.1.0
===============

### NEW FEATURES

* released to CRAN
