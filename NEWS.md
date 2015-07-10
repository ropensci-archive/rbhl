rbhl 0.2.0
===============

### NEW FEATURES 

* Gains new funtions `bhl_getauthoparts()`, `bhl_getitemparts()`, `bhl_getpartbibtex()`, `bhl_getpartbyidentifier()`, `bhl_getpartendnote()`, `bhl_getpartmetadata()`, `bhl_getpartnames()`, `bhl_getsubjectparts()`, `bhl_getunpublishedparts()`, and `bhl_partsearch()` (#6)
* New function `getpages()` to get multiple OCR pages at once, given an itemid (#4)

### BUG FIXES

* Import all non-base R functions (#13)
* Fix to README, requested by CRAN, to an image that didn't have an alt attribute (#8) (#11) (#12)
* Removed arguments in `bhl_getpageocrtext()` for names and ocr that weren't actually available in the API method. (#3)
* Some functions were missing parameters, and have now been added in where appropriate. (#5)

rbhl 0.1.0
===============

### NEW FEATURES 

* released to CRAN
