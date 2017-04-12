context("bhl_namelist")

test_that("bhl_namelist works", {
  skip_on_cran()

  tt <- bhl_namelist(startrow=1, batchsize=99, startdate='10/15/2009',
                     enddate='10/16/2009')
  vv <- bhl_namelist(startrow=1, batchsize=99, startdate='10/15/2009',
                     enddate='10/16/2009', as = "xml")
  zz <- bhl_namelist(startrow=1, batchsize=99, startdate='10/15/2009',
                     enddate='10/16/2009', as = "json")

  # the correct classes
  expect_is(tt, "data.frame")

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
