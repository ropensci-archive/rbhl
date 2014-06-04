# tests for bhl_collection fxn in rbhl
context("bhl_collection")

library("XML")
library("RJSONIO")

tt <- bhl_getcollections()
uu <- bhl_getcollections(out = 'raw')

test_that("bhl_collection returns the correct class", {
	expect_is(tt, "list")
	expect_is(tt$Result, "list")
  
	expect_is(uu, "character")
	expect_is(fromJSON(uu), "list")
	expect_is(fromJSON(uu)$Result[[1]]$CollectionName, "character")
})

test_that("bhl_collection returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(fromJSON(uu)), 3)
})