# tests for bhl_getitembyidentifier fxn in rbhl
context("bhl_getitembyidentifier")

test_that("bhl_getitembyidentifier returns the correct class", {
	skip_on_cran()

	tt <- bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi')
	#uu <- bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', as='xml')
	vv <- bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', as='list')

	expect_is(tt, "data.frame")

	# expect_is(uu, "character")
	# expect_is(xml2::read_xml(uu), "xml_document")
	# expect_is(xml2::xml_find_all(xml2::read_xml(uu), "//Year")[[1]], "xml_node")
	# expect_is(xml2::xml_text(xml2::xml_find_all(xml2::read_xml(uu), "//Year")),
	#           "character")

	expect_is(vv, "list")
	expect_is(vv$Status, "character")
	expect_null(vv$ErrorMessage)

  expect_gt(NCOL(tt), 10)
  #expect_equal(length(uu), 1)
  #expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(vv$Status), 1)
  expect_equal(length(vv), 3)
  expect_gt(length(vv$Result), 10)
})
