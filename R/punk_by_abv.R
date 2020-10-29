#' punk_by_abv
#'
#' @param abv_gt numeric in character
#' @param abv_lt numeric in character
#'
#' @return a tibble
#' @export
#' @import purrr
#'
#' @examples
#' punk_by_abv(abv_gt = "3", abv_lt = "6")
#'
punk_by_abv <- function(abv_gt, abv_lt) {

  assert_that(is_character(abv_gt))
  assert_that(is_character(abv_lt))


res <- httr::GET(
    "https://api.punkapi.com/v2/beers",
    query = list("abv_gt" = abv_gt, "abv_lt" = abv_lt)
  )

check_results(res)

ct <- content(res)[[1]]


parse_result(ct)

}
