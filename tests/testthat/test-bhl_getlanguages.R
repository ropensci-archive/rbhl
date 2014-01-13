# tests for bhl_getlanguages fxn in rbhl
context("bhl_getlanguages")

library(XML)
library(RJSONIO)

tt <- bhl_getlanguages()
uu <- bhl_getlanguages(output='parsed')
vv <- bhl_getlanguages(output='raw')
zz <- bhl_getlanguages(output='raw', format='xml')

test_that("bhl_getlanguages returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "list")
  
  expect_is(uu, "data.frame")
  
  expect_is(vv, "character")
  expect_is(fromJSON(vv), "list")
  
  expect_is(zz, "character")
  expect_is(xmlParse(zz), "XMLInternalDocument")
})

test_that("bhl_getlanguages returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(nrow(uu), 64)
  expect_equal(length(fromJSON(vv)), 3)
  expect_equal(length(zz), 1)
  expect_equal(length(xmlParse(zz)), 1)
})