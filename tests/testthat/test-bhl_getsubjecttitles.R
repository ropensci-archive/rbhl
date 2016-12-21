# tests for bhl_getpanames fxn in rbhl
context("bhl_getsubjecttitles")

test_that("bhl_getsubjecttitles returns the correct class", {
	skip_on_cran()

	tt <- bhl_getsubjecttitles('diptera')
	uu <- bhl_getsubjecttitles('diptera', 'xml')
	vv <- bhl_getsubjecttitles('diptera', 'json')

  expect_is(tt, "data.frame")

  expect_is(uu, "character")
  expect_is(xml2::read_xml(uu), "xml_document")

  expect_is(vv, "character")
  expect_is(jsonlite::fromJSON(vv), "list")

  expect_equal(length(uu), 1)
  expect_equal(length(xml2::read_xml(uu)), 2)
  expect_equal(length(vv), 1)
  expect_equal(length(jsonlite::fromJSON(vv)), 3)
})
