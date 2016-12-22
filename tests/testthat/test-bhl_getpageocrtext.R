# tests for bhl_getpanames fxn in rbhl
context("bhl_getpageocrtext")

test_that("bhl_getpageocrtext returns the correct class", {
  skip_on_cran()

  tt <- bhl_getpageocrtext(1328690, 'json')
  #uu <- bhl_getpageocrtext(1328690, 'xml')
  vv <- bhl_getpageocrtext(1328690)

  #expect_is(uu, "character")
  #expect_is(xml2::read_xml(uu), "xml_document")

  expect_is(tt, "character")
  expect_is(jsonlite::fromJSON(tt), "list")
  expect_null(jsonlite::fromJSON(tt)$ErrorMessage)

  expect_is(vv, "character")

  expect_equal(length(tt), 1)
  #expect_equal(length(uu), 1)
  #expect_equal(length(xml2::read_xml(uu)), 2)
  expect_equal(NCOL(vv), 1)
})
