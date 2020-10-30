test_that("punk_randoms works", {
  expect_true(is.data.frame(punk_randoms()))
  expect_true("beer" %in% class(punk_randoms()))
})
