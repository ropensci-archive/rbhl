# tests for bhl_getitembyidentifier fxn in rbhl
context("bhl_getitembyidentifier")

library("XML")
require("jsonlite", warn.conflicts = FALSE, quietly = TRUE)

tt <- bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi')
uu <- bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml', output='raw')
vv <- bhl_getitembyidentifier(type='ia', value='animalkingdomarr03cuvi', format='xml', output='parsed')

test_that("bhl_getitembyidentifier returns the correct class", {
	expect_is(tt, "list")
	expect_is(tt$Result, "data.frame")

	expect_is(uu, "character")
	expect_is(xmlParse(uu), "XMLInternalDocument")
	expect_is(xpathApply(xmlParse(uu), "//Year")[[1]], "XMLInternalElementNode")
	expect_is(xpathApply(xmlParse(uu), "//Year", xmlValue)[[1]][[1]], "character")

	expect_is(vv, "XMLDocument")
	expect_is(vv$doc$children$Response, "XMLNode")
})

test_that("bhl_getitembyidentifier returns the correct dimensions", {
  expect_equal(length(tt), 3)
  expect_equal(length(tt$Status), 1)
  expect_equal(length(uu), 1)
  expect_equal(length(xmlParse(uu)), 1)
  expect_equal(length(vv), 2)
  expect_equal(length(vv$doc), 3)
})
