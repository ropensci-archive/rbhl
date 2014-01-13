# tests for bhl_getpanames fxn in rbhl
context("bhl_gettitlebibtex")

library(XML)
library(RJSONIO)

tt <- bhl_gettitlebibTex(1726)
uu <- bhl_gettitlebibTex(1726, output='raw')
vv <- bhl_gettitlebibTex(1726, format='xml', output='raw')
zz <- bhl_gettitlebibTex(1726, format='xml', output='parsed')

test_that("bhl_gettitlebibtex returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "character")
  
  expect_is(uu, "character")
  expect_is(fromJSON(uu), "list")
  
  expect_is(vv, "character")
  expect_is(xmlParse(vv), "XMLInternalDocument")
  
  expect_is(zz, "XMLDocument")
  expect_is(zz$doc, "XMLDocumentContent")
})

test_that("bhl_gettitlebibtex returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(fromJSON(uu)), 3)
  expect_equal(length(vv), 1)
  expect_equal(length(xmlParse(vv)), 1)
  expect_equal(length(zz), 2)
  expect_equal(length(zz$doc), 3)
})