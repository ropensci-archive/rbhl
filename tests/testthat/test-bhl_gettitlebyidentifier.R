# tests for bhl_getpanames fxn in rbhl
context("bhl_gettitlebyidentifier")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_gettitlebyidentifier('oclc', 2992225)
vv <- bhl_gettitlebyidentifier('oclc', 2992225, as='xml')
zz <- bhl_gettitlebyidentifier('oclc', 2992225, as='json')

test_that("bhl_gettitlebyidentifier returns the correct class", {
  expect_is(tt, "data.frame")

  expect_is(zz, "character")
  expect_is(fromJSON(zz), "list")

  expect_is(vv, "character")
  expect_is(xmlParse(vv), "XMLInternalDocument")
})

test_that("bhl_gettitlebyidentifier returns the correct dimensions", {
  expect_equal(NCOL(tt), 21)
  expect_equal(length(zz), 1)
  expect_equal(length(fromJSON(zz)), 3)
  expect_equal(length(vv), 1)
  expect_equal(length(xmlParse(vv)), 1)
})
