# tests for bhl_getpagemetadata fxn in rbhl
context("bhl_getpagemetadata")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getpagemetadata(page=1328690, ocr=TRUE, as='list')
uu <- bhl_getpagemetadata(page=1328690, ocr=TRUE, as='xml')
vv <- bhl_getpagemetadata(page=1328690, ocr=TRUE, as='json')

test_that("bhl_getpagemetadata returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "list")
  expect_null(tt$ErrorMessage)

  expect_is(uu, "character")

  expect_is(vv, "character")
})

test_that("bhl_getpagemetadata returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(vv), 1)
})
