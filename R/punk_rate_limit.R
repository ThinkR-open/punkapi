#' Checks API rate limit
#'
#'
#' @return a integer of the remaining rate limit
#' @export
#' @importFrom httr headers GET
#' @rdname punk_rate_limit
#' @examples
#' punk_rate_limit()

punk_rate_limit <- function() {

  check_internet()

  headers(GET("https://api.punkapi.com/v2/beers"))$`x-ratelimit-remaining`
}

#' Checks if API rate limit is reached
#'
#'
#' @return a boolean
#' @export
#' @rdname punk_rate_limit
#'
#' @examples check_rate_limit()
check_rate_limit <- function() {

  check_internet()

  rate_limit <- punk_rate_limit()

  assert_that(rate_limit != 429, msg = "You have reached your limit on this ip address please wait an hour")

  message(glue::glue("{rate_limit} calls remaining"))

  return(TRUE)

}

