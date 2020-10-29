#' Get a Beer by its id
#'
#' @return a dataframe with plenty of information about the chosen beer
#'
#' @param id beer id
#'
#' @export
#' @importFrom httr GET content
#' @importFrom assertthat assert_that
#'
#' @rdname punk_random
#'
#' @examples
#' punk_by_id(id = 1)
punk_by_id <- function(id = NULL) {

  assert_that(!is.null(id),
              msg = "Beer id must not be NULL")


  assert_that(is.numeric(id),
              msg = "Beer id must be numeric")

  res <- GET(paste0("https://api.punkapi.com/v2/beers/", id))
  check_results(res)
  ct <- content(res)[[1]]
  parse_result(ct)
}

slow_punk_id <- purrr::slowly(
  punk_by_id,
  rate = purrr::rate_delay(1)
)

#' Vectorized version of punk_by_id
#'
#' @param lst List of beer ids
#'
#' @return A dataframe containing the API request data
#' @export
#' @rdname punk_by_id
#'
#' @importFrom purrr map_df
#'
#' @examples
#' punk_by_ids(lst = list(1,2,3,4))
punk_by_ids <- function(lst) {
  map_df(
    lst,
    slow_punk_id
  )
}
