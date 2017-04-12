context("getpages")

test_that("getpages works", {
  skip_on_cran()

  tt <- getpages(itemid = 16800)

  # the correct classes
  expect_is(tt, "list")

  expect_is(tt[[1]], "character")
  expect_gt(length(tt), 50)
})
