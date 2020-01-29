context("rbhl utils")

test_that("bool2let", {
  expect_null(bool2let(NULL))
  expect_equal(bool2let(TRUE, letters[1:2]), "a")
  expect_equal(bool2let(FALSE, letters[1:2]), "b")

  # errors
  expect_error(bool2let(TRUE), "missing")
  expect_error(bool2let("asdf"), "is not TRUE")
  expect_error(bool2let(TRUE, letters[1:3]), "is not TRUE")
})
