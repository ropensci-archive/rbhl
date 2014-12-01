# tests for bhl_getitempages fxn in rbhl
context("bhl_getitempages")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getitempages('16800')
uu <- bhl_getitempages('16800', as='xml')
vv <- bhl_getitempages('16800', as='json')

test_that("bhl_getitempages returns the correct class", {
  expect_is(tt, "data.frame")

  expect_is(bhl_getitempages('16800', as = "list")$Result, "list")

  expect_is(uu, "character")
  expect_is(xmlParse(uu), "XMLInternalDocument")
  expect_is(xpathApply(xmlParse(uu), "//Page"), "XMLNodeSet")

  expect_is(vv, "character")
  expect_is(jsonlite::fromJSON(vv, FALSE), "list")
})

test_that("bhl_getitempages returns the correct dimensions", {
  expect_equal(NCOL(tt), 13)
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(xpathApply(xmlParse(uu), "//Page")), 78)
  expect_equal(length(vv), 1)
  expect_equal(length(jsonlite::fromJSON(vv)), 3)
})
