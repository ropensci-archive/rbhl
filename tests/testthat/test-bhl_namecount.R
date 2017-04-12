context("bhl_namecount")

test_that("bhl_namecount works", {
  skip_on_cran()

  tt <- bhl_namecount(startdate = '12/25/2009', enddate = '12/27/2009')
  zz <- bhl_namecount(startdate = '12/25/2009', enddate = '12/27/2009',
                      as='json')

  # the correct classes
  expect_is(tt, "data.frame")

  expect_is(zz, "character")
  expect_is(jsonlite::fromJSON(zz), "list")

  # the correct dimensions
  expect_equal(length(zz), 1)
  expect_equal(length(jsonlite::fromJSON(zz)), 3)
})
