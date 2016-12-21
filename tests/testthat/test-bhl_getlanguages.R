# tests for bhl_getlanguages fxn in rbhl
context("bhl_getlanguages")

test_that("bhl_getlanguages returns the correct class", {
  skip_on_cran()

  tt <- bhl_getlanguages()
  uu <- bhl_getlanguages('list')
  vv <- bhl_getlanguages('json')
  zz <- bhl_getlanguages('xml')

  expect_is(tt, "data.frame")

  expect_is(uu, "list")

  expect_is(vv, "character")
  expect_is(jsonlite::fromJSON(vv), "list")

  expect_is(zz, "character")
  expect_is(xml2::read_xml(zz), "xml_document")

  expect_equal(NCOL(tt), 2)
  expect_equal(length(uu), 3)
  expect_equal(length(uu$Status), 1)
  expect_equal(length(jsonlite::fromJSON(vv)), 3)
  expect_equal(length(zz), 1)
  expect_equal(length(xml2::read_xml(zz)), 2)
})
