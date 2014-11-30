# tests for bhl_booksearch fxn in rbhl
context("bhl_booksearch")

library(XML)
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_booksearch('evolution', year=2000, output='raw')
uu <- bhl_booksearch('evolution', year=2000, output='raw', format='xml')
vv <- bhl_booksearch('evolution', year=2000, output='parsed', format="xml")

test_that("bhl_booksearch returns the correct class", {
	expect_is(tt, "character")
	expect_is(fromJSON(tt), "list")

	expect_is(uu, "character")
	expect_is(xmlParse(uu), "XMLInternalDocument")
	expect_is(xpathApply(xmlParse(uu), '//Result'), "XMLNodeSet")

	expect_is(vv, "XMLDocument")
})

test_that("bhl_booksearch returns the correct dimensions", {
  expect_equal(length(tt), 1)
  expect_equal(length(fromJSON(tt)$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(vv), 2)
})
