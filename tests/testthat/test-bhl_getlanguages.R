# tests for bhl_getlanguages fxn in rbhl
context("bhl_getlanguages")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getlanguages()
uu <- bhl_getlanguages('list')
vv <- bhl_getlanguages('json')
zz <- bhl_getlanguages('xml')

test_that("bhl_getlanguages returns the correct class", {
  expect_is(tt, "data.frame")

  expect_is(uu, "list")

  expect_is(vv, "character")
  expect_is(fromJSON(vv), "list")

  expect_is(zz, "character")
  expect_is(xmlParse(zz), "XMLInternalDocument")
})

test_that("bhl_getlanguages returns the correct dimensions", {
  expect_equal(NCOL(tt), 2)
  expect_equal(length(uu), 3)
  expect_equal(length(uu$Status), 1)
  expect_equal(length(fromJSON(vv)), 3)
  expect_equal(length(zz), 1)
  expect_equal(length(xmlParse(zz)), 1)
})
