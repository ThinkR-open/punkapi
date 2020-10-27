test_that("Selection biere avec id = 1 OK", {
  expect_true(check_results(requete =
                              httr::GET("https://api.punkapi.com/v2/beers/1")))
})


test_that("Selection biere avec id en character NOT OK", {
  expect_error(check_results(requete =
                              httr::GET("https://api.punkapi.com/v2/beers/BEER")))
})
