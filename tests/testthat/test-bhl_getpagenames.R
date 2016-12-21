# tests for bhl_getpanames fxn in rbhl
context("bhl_getpagenames")

test_that("bhl_getpagenames returns the correct class", {
  skip_on_cran()

  tt <- bhl_getpagenames('1328690')
  uu <- bhl_getpagenames('1328690', 'xml')
  vv <- bhl_getpagenames('1328690', 'json')

  expect_is(tt, "data.frame")

  expect_is(uu, "character")
  expect_is(xml2::read_xml(uu), "xml_document")

  expect_is(vv, "character")
  expect_is(jsonlite::fromJSON(vv), "list")
  expect_is(jsonlite::fromJSON(vv)$Result, "data.frame")


  expect_equal(NCOL(tt), 5)
  expect_equal(length(uu), 1)
  expect_equal(length(xml2::read_xml(uu)), 2)
  expect_equal(length(vv), 1)
  expect_equal(length(jsonlite::fromJSON(vv)$Status), 1)
})
