# tests for bhl_booksearch fxn in rbhl
context("bhl_booksearch")

library(XML)
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_booksearch('evolution', year=2000)
uu <- bhl_booksearch('evolution', year=2000, as='list')
vv <- bhl_booksearch('evolution', year=2000, as="xml")

test_that("bhl_booksearch returns the correct class", {
  expect_is(tt, "data.frame")

	expect_is(uu, "list")

	expect_is(vv, "character")
	expect_is(xmlParse(vv), "XMLInternalDocument")
	expect_is(xpathApply(xmlParse(vv), '//Result'), "XMLNodeSet")
})

test_that("bhl_booksearch returns the correct dimensions", {
  expect_equal(NCOL(tt), 21)
  expect_equal(length(uu), 3)
  expect_equal(length(xmlParse(vv)), 1)
})
