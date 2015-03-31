# tests for bhl_getpanames fxn in rbhl
context("bhl_getsubjecttitles")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getsubjecttitles('diptera')
uu <- bhl_getsubjecttitles('diptera', 'xml')
vv <- bhl_getsubjecttitles('diptera', 'json')

test_that("bhl_getsubjecttitles returns the correct class", {
  expect_is(tt, "data.frame")

  expect_is(uu, "character")
  expect_is(xmlParse(uu), "XMLInternalDocument")

  expect_is(vv, "character")
  expect_is(jsonlite::fromJSON(vv), "list")
})

test_that("bhl_getsubjecttitles returns the correct dimensions", {
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(vv), 1)
  expect_equal(length(jsonlite::fromJSON(vv)), 3)
})
