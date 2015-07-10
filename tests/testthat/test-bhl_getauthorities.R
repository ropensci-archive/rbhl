# tests for bhl_getauthorities fxn in rbhl
context("bhl_getauthorities")

tt <- bhl_getauthortitles(1970)
uu <- bhl_getauthortitles(1970, as='json')
vv <- bhl_getauthortitles(1970, as='xml')

test_that("bhl_getauthorities returns the correct class", {
	expect_is(tt$data, "data.frame")

	expect_is(uu, "character")
	expect_is(fromJSON(uu), "list")
	expect_is(fromJSON(uu)$Result$FullTitle, "character")

	expect_is(vv, "character")
	expect_is(xmlParse(vv), "XMLInternalDocument")
})

test_that("bhl_getauthorities returns the correct dimensions", {
  expect_equal(length(uu), 1)
  expect_equal(length(fromJSON(uu)), 3)
  expect_equal(length(xmlParse(vv)), 1)
})
