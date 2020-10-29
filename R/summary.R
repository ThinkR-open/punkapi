

#' Title
#'
#' @param df data frame resulting from https://api.punkapi.com/v2/beers request
#' @param ...
#'
#' @return a specific summary output for object of beer class
#' @export
#'
#' @examples
#'
#' summary()
summary.beer <- function (df, ...) {

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
