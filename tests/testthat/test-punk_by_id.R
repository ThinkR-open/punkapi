test_that("select beer by id #1 OK", {
  expect_equal(nrow(punk_by_id(id = 1)), 1)
})

test_that("select beer by ids #1 #2 #3 OK", {
  expect_equal(nrow(punk_by_ids(lst = list(1,2,3))), 3)
})
