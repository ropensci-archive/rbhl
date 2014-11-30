# tests for bhl_getpagemetadata fxn in rbhl
context("bhl_getpagemetadata")

library(XML)
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getpagemetadata(page=1328690, ocr=TRUE, format='json')
uu <- bhl_getpagemetadata(page=1328690, ocr=TRUE, format='xml')
vv <- bhl_getpagemetadata(page=1328690, ocr=TRUE, format='xml', output='parsed')

test_that("bhl_getpagemetadata returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "list")

  expect_is(uu, "list")
  expect_equal(uu$ErrorMessage, NULL)

  expect_is(vv, "XMLDocument")
  expect_is(vv$doc, "XMLDocumentContent")
})

test_that("bhl_getpagemetadata returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 3)
  expect_equal(length(uu$Status), 1)
  expect_equal(length(vv), 2)
  expect_equal(length(vv$doc), 3)
})
