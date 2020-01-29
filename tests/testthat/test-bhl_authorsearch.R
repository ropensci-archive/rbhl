test_that("bhl_authorsearch", {
	skip_on_cran()

	tt <- bhl_authorsearch(name='dimmock')
	uu <- bhl_authorsearch(name='dimmock', as = "list")

	# correct classes
	expect_is(tt, "data.frame")
	expect_is(tt$CreatorUrl, "character")

	expect_is(uu, "list")
	expect_is(uu$Status, "character")
	expect_is(uu$Result, "list")
	expect_is(uu$Result[[1]]$AuthorID, "character")
  expect_is(bhl_authorsearch(name='dimmock', as="json"), "character")
	expect_is(bhl_authorsearch(name='dimmock', as="xml"), "character")
  expect_gt(NROW(tt), 2)
  expect_equal(uu$Status, "ok")
})
