test_that("bhl_getitemmetadata", {
	vcr::use_cassette("bhl_getitemmetadata", {
  	tt <- bhl_getitemmetadata('16800', TRUE)
  	uu <- bhl_getitemmetadata('16800', TRUE, as='xml')
  	vv <- bhl_getitemmetadata('16800', TRUE, as='json')
  })

  expect_is(tt, "data.frame")

  expect_is(uu, "character")
  expect_is(xml2::read_xml(uu), "xml_document")

  expect_is(vv, "character")
  expect_is(jsonlite::fromJSON(vv), "list")

  expect_equal(NROW(tt), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(vv), 1)
  expect_equal(length(jsonlite::fromJSON(vv)), 3)
})
