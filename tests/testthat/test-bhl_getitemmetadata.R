# tests for bhl_getitemmetadata fxn in rbhl
context("bhl_getitemmetadata")

library(XML)
library(RJSONIO)

tt <- bhl_getitemmetadata('16800', TRUE)
uu <- bhl_getitemmetadata('16800', TRUE, format='xml', output='parsed')
vv <- bhl_getitemmetadata('16800', TRUE, format='json', output='raw')
zz <- bhl_getitemmetadata('16800', TRUE, format='xml', output='raw')

test_that("bhl_getitemmetadata returns the correct class", {
  expect_is(tt, "list")
  expect_is(tt$Result, "list")
  
  expect_is(uu, "XMLDocument")
  expect_is(uu$doc$version, "character")
  expect_is(uu$doc$children, "list")
  
  expect_is(vv, "character")
  expect_is(fromJSON(vv), "list")
})

test_that("bhl_getitemmetadata returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 2)
  expect_equal(length(uu$doc), 3)
  expect_equal(length(vv), 1)
  expect_equal(length(fromJSON(vv)), 3)
})