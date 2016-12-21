# tests for bhl_booksearch fxn in rbhl
context("bhl_booksearch")

test_that("bhl_booksearch returns the correct class", {
	skip_on_cran()

	tt <- bhl_booksearch('evolution', year=2000)
	uu <- bhl_booksearch('evolution', year=2000, as='list')
	vv <- bhl_booksearch('evolution', year=2000, as="xml")

  expect_is(tt, "data.frame")

	expect_is(uu, "list")

	expect_is(vv, "character")
	expect_is(xml2::read_xml(vv), "xml_document")
	expect_is(xml2::xml_find_all(xml2::read_xml(vv), '//Result'), "xml_nodeset")
})
