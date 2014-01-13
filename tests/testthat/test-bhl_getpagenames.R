# tests for bhl_getpanames fxn in rbhl
context("bhl_getpagenames")

library(XML)
library(RJSONIO)

tt <- bhl_getpagenames('1328690')
uu <- bhl_getpagenames('1328690', 'xml', 'raw')
vv <- bhl_getpagenames('1328690', 'xml', 'parsed')

test_that("bhl_getpagenames returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "list")
  
  expect_is(uu, "character")
  expect_is(xmlParse(uu), "XMLInternalDocument")
  
  expect_is(vv, "XMLDocument")
  expect_is(vv$doc, "XMLDocumentContent")
})

test_that("bhl_getpagenames returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(vv), 2)
  expect_equal(length(vv$doc), 3)
})