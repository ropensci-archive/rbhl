context("bhl_openurl")

test_that("bhl_openurl works", {
  skip_on_cran()

  tt <- bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
                    aufirst="Samuel Wendell", aulast="Williston", date=1908,
                    spage=16)
  vv <- bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
                    aufirst="Samuel Wendell", aulast="Williston", date=1908,
                    spage=16, as='xml')
  zz <- bhl_openurl(genre="book", title="Manual+of+North+American+Diptera",
                    aufirst="Samuel Wendell", aulast="Williston", date=1908,
                    spage=16, as='json')

  # the correct classes
  expect_is(tt, "list")

  expect_is(zz, "character")
  expect_is(jsonlite::fromJSON(zz), "list")

  expect_is(vv, "character")
  expect_is(xml2::read_xml(vv), "xml_document")

  # the correct dimensions
  expect_equal(length(zz), 1)
  expect_equal(length(jsonlite::fromJSON(zz)), 3)
  expect_equal(length(vv), 1)
  expect_equal(length(xml2::read_xml(vv)), 2)
})
