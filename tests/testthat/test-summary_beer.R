test_that("summary_beer works", {
  res <- httr::GET("https://api.punkapi.com/v2/beers", query = list("per_page" = "80"))
  check_results(res)
  df <- httr::content(res)
  # expect a list of dataframe
  expect_true(is.list(df))

  # sumary.beer is dedicated for a beer class object
  expect_true("beer" %in% class(df))

  # checking output with colnames
  colnames_summary <- c("date", "count", "abv")
  expect_equal(sum(colnames_summary %in% names(summary.beer(df)), na.rm = TRUE), length(colnames_summary))


})
