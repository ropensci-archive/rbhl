# tests for bhl_bioherlib fxn in rbhl
context("bhl_bioherlib")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE)
uu <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, format="xml", output='raw')
vv <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, output='raw')

test_that("bhl_bioherlib returns the correct class", {
	expect_is(tt, "list")
	expect_is(tt$Status, "character")
	expect_is(tt$Result, "list")
	expect_is(tt$Result$ItemID, "integer")

	expect_is(uu, "character")
	expect_is(xmlParse(uu), "XMLInternalDocument")
	expect_is(xpathApply(xmlParse(uu), '//Result'), "XMLNodeSet")

	expect_is(vv, "character")
	expect_is(fromJSON(vv), "list")
	expect_is(fromJSON(vv)$Result, "list")
})

test_that("bhl_bioherlib returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(vv), 1)
})
