# tests for bhl_getpanames fxn in rbhl
context("bhl_getpageocrtext")

library(XML)
library(RJSONIO)

tt <- bhl_getpageocrtext(1328690, 'json')
uu <- bhl_getpageocrtext(1328690, 'xml', 'raw')
vv <- bhl_getpageocrtext(1328690, 'xml', 'parsed')

test_that("bhl_getpageocrtext returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "character")
  
  expect_is(uu, "character")
  expect_is(xmlParse(uu), "XMLInternalDocument")
  
  expect_is(vv, "XMLDocument")
  expect_is(vv$doc, "XMLDocumentContent")
})

test_that("bhl_getpageocrtext returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(vv), 2)
  expect_equal(length(vv$doc), 3)
})