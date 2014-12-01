# tests for bhl_getpanames fxn in rbhl
context("bhl_gettitlebibtex")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_gettitlebibTex(1726)
vv <- bhl_gettitlebibTex(1726, as='xml')
uu <- bhl_gettitlebibTex(1726, as='json')

test_that("bhl_gettitlebibtex returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "character")

  expect_is(uu, "character")
  expect_is(fromJSON(uu), "list")

  expect_is(vv, "character")
  expect_is(xmlParse(vv), "XMLInternalDocument")
})

test_that("bhl_gettitlebibtex returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(fromJSON(uu)), 3)
  expect_equal(length(vv), 1)
  expect_equal(length(xmlParse(vv)), 1)
})
