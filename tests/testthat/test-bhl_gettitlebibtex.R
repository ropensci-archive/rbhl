# tests for bhl_getpanames fxn in rbhl
context("bhl_gettitlebibtex")

test_that("bhl_gettitlebibtex returns", {
  skip_on_cran()

  tt <- bhl_gettitlebibTex(1726)
  #vv <- bhl_gettitlebibTex(1726, as='xml')
  uu <- bhl_gettitlebibTex(1726, as = 'json')

  # correct classes
  expect_is(tt, "list")
  expect_is(tt$Result, "character")

  expect_is(uu, "character")
  expect_is(jsonlite::fromJSON(uu), "list")

  #expect_is(vv, "character")
  #expect_is(xml2::read_xml(vv), "xml_document")

  #correct dimensions
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(jsonlite::fromJSON(uu)), 3)
  #expect_equal(length(vv), 1)
  #expect_equal(length(xml2::read_xml(vv)), 2)
})
