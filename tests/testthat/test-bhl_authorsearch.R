# tests for bhl_authorsearch fxn in rbhl
context("bhl_authorsearch")

tt <- bhl_authorsearch(name='dimmock')

test_that("bhl_authorsearch returns the correct class", {
	expect_is(tt, "list")
	expect_is(tt$Status, "character")
	expect_is(tt$Result, "list")
	expect_is(tt$Result[[1]]$Dates, "character")
})

test_that("bhl_authorsearch returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(tt$Result), 2)
  expect_equal(length(tt$Result[[1]]), 10)
})