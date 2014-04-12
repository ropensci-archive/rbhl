# tests for bhl_getitempages fxn in rbhl
context("bhl_getitempages")

library(XML)
library(RJSONIO)

tt <- bhl_getitempages('16800')
uu <- bhl_getitempages('16800', format='xml', output='raw')
vv <- bhl_getitempages('16800', format='xml', output='parsed')

test_that("bhl_getitempages returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "list")
  
  expect_is(uu, "character")
  expect_is(xmlParse(uu), "XMLInternalDocument")
  expect_is(xpathApply(xmlParse(uu), "//Page"), "XMLNodeSet")
  
  expect_is(vv, "XMLDocument")
  expect_is(xpathApply(vv$doc$children[[1]], "//Page"), "list")
})

test_that("bhl_getitempages returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(xpathApply(xmlParse(uu), "//Page")), 78)
  expect_equal(length(vv), 2)
  expect_equal(length(xpathApply(vv$doc$children[[1]], "//Page")), 78)
})