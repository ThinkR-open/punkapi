

#' summary.beer - a specific summary method for beer class object
#'
#' @param ...
#' @param list list of dataframe or single dataframe resulting from api.punkapi.com
#'
#' @return a tibble
#' @export
#' @importFrom purrr map_df
#' @import dplyr
#' @examples
#' res <- httr::GET("https://api.punkapi.com/v2/beers", query = list("per_page" = "80"))
#' check_results(res)
#' df <- httr::content(res)
#' summary.beer(df)



summary.beer <- function(list, ...) {

  assert_that(is_list(list))
  assert_that("beer" %in% class(list), msg = "Not a beer class object")

  purrr::map_df(
    df, ~{
      tibble::tibble(
        id = .x$id,
        abv = round(.x$abv),
        date = lubridate::myd(
          paste0(.x$first_brewed, "-01")
        ),

      ) %>%
        dplyr::mutate(
          date = lubridate::year(date)
        )
    }
  ) %>%
    dplyr::group_by(date) %>%
    dplyr::summarise(
      count = dplyr::n(),
      abv = mean(abv)
    )


}

