test_that("bhl_publicationsearch", {
  skip_on_cran()
  vcr::use_cassette("bhl_publicationsearch", {
    tt <- bhl_publicationsearch('cocos island costa rica birds')
    zz <- bhl_publicationsearch('nematocerous', as='json')
  })

  expect_is(tt, "data.frame")
  expect_is(zz, "character")
  expect_is(jsonlite::fromJSON(zz), "list")

  # the correct dimensions
  expect_equal(length(zz), 1)
  expect_equal(length(jsonlite::fromJSON(zz)), 3)
})

test_that("bhl_publicationsearchadv", {
  skip_on_cran()
  vcr::use_cassette("bhl_publicationsearchadv", {
    tt <- bhl_publicationsearchadv(title = "cocos island",
      authorname = "gifford")
  })

  expect_is(tt, "data.frame")
  expect_gt(NROW(tt), 1)
})
