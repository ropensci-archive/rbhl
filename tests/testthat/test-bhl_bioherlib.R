# tests for bhl_bioherlib fxn in rbhl
context("bhl_bioherlib")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE)
uu <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, as="list")
vv <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, as='xml')

test_that("bhl_bioherlib returns the correct class", {
	expect_is(tt, "data.frame")

  expect_is(uu$Status, "character")
	expect_is(uu$Result, "list")
	expect_is(uu$Result$ItemID, "integer")

	expect_is(vv, "character")
	expect_is(xmlParse(vv), "XMLInternalDocument")
	expect_is(xpathApply(xmlParse(vv), '//Result'), "XMLNodeSet")
})

test_that("bhl_bioherlib returns the correct dimensions", {
  expect_equal(NCOL(tt), 15)
  expect_equal(length(uu$Status), 1)
  expect_equal(length(uu), 3)
  expect_equal(length(vv), 1)
})
