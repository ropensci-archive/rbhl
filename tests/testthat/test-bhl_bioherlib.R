# tests for bhl_bioherlib fxn in rbhl
context("bhl_bioherlib")

test_that("bhl_bioherlib returns", {
	skip_on_cran()

	tt <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE)
	uu <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, as="list")
	vv <- bhl_bioherlib(method='GetPageMetadata', pageid=1328690, ocr=TRUE, names=TRUE, as='xml')

	# correct classes
	expect_is(tt, "data.frame")

  expect_is(uu$Status, "character")
	expect_is(uu$Result, "list")
	expect_is(uu$Result$ItemID, "integer")

	expect_is(vv, "character")
	expect_is(xml2::read_xml(vv), "xml_document")
	expect_is(xml2::xml_find_all(xml2::read_xml(vv), '//Result'), "xml_nodeset")

	# correct dimensions
  expect_equal(NCOL(tt), 15)
  expect_equal(length(uu$Status), 1)
  expect_equal(length(uu), 3)
  expect_equal(length(vv), 1)
})
