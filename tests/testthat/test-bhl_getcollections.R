test_that("bhl_collection", {
  skip_on_cran()
	vcr::use_cassette("bhl_getcollections", {
  	tt <- bhl_getcollections()
  	uu <- bhl_getcollections(as = 'json')
  })

	expect_is(tt, "data.frame")

	expect_is(uu, "character")
	expect_is(jsonlite::fromJSON(uu), "list")
	expect_is(jsonlite::fromJSON(uu)$Result$CollectionName, "character")

  expect_gt(NROW(tt), 3)
  expect_equal(length(uu), 1)
  expect_equal(length(jsonlite::fromJSON(uu)), 3)
})
