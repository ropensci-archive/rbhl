# tests for bhl_getcollection fxn in rbhl
context("bhl_getcollection")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getcollections()
uu <- bhl_getcollections(as = 'json')

test_that("bhl_collection returns the correct class", {
	expect_is(tt, "data.frame")

	expect_is(uu, "character")
	expect_is(fromJSON(uu), "list")
	expect_is(fromJSON(uu)$Result$CollectionName, "character")
})

test_that("bhl_collection returns the correct dimensions", {
  expect_equal(NCOL(tt), 5)
  expect_equal(length(uu), 1)
  expect_equal(length(fromJSON(uu)), 3)
})
