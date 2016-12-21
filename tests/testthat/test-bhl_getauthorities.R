# tests for bhl_getauthorities fxn in rbhl
context("bhl_getauthorities")

test_that("bhl_getauthorities returns the correct class", {
	skip_on_cran()

	tt <- bhl_getauthortitles(1970)
	uu <- bhl_getauthortitles(1970, as='json')
	vv <- bhl_getauthortitles(1970, as='xml')

	expect_is(tt, "data.frame")

	expect_is(uu, "character")
	expect_is(jsonlite::fromJSON(uu), "list")
	expect_is(jsonlite::fromJSON(uu)$Result$FullTitle, "character")

	expect_is(vv, "character")
	expect_is(xml2::read_xml(vv), "xml_document")

  expect_equal(length(uu), 1)
  expect_equal(length(jsonlite::fromJSON(uu)), 3)
  expect_equal(length(xml2::read_xml(vv)), 2)
})
