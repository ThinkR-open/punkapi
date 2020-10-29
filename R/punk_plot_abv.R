library("ggplot2")
library("assertthat")
library("dplyr")

punk_plot_abv <- function(perpage){
  assert_that(
    is.numeric(perpage),
    msg = "perpage should be an integer"
  )
  assert_that(
    perpage>0,
    msg = "perpage should be larger than 0"
  )
  assert_that(
    perpage<100,
    msg = "perpage should be less than 100"
  )
  res <- httr::GET(
    "https://api.punkapi.com/v2/beers",
    query = list("per_page" = as.character(perpage))
  )
  check_results(res)
  df <- httr::content(res)
  purrr::map_df(
    df, ~{
      tibble::tibble(
        id = .x$id,
        abv = round(.x$abv)
      )
    }
  ) %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = abv
      )
    ) +
    ggplot2::geom_bar()
}
