#' Get a Random Beer
#'
#' @return a dataframe with plenty of information about a random famous beer
#'
#' @param n number of element to return
#'
#' @export
#' @importFrom httr GET content
#' @importFrom purrr map_df
#'
#' @rdname punk_random
#'
#' @examples
#' punk_random()
#' punk_randoms(7)
punk_random <- function() {
   res <- GET("https://api.punkapi.com/v2/beers/random")
   check_results(res)
   ct <- content(res)[[1]]
   parse_result(ct)
}

slow_punk_random <- purrr::slowly(
   punk_random,
   rate = purrr::rate_delay(1)
)

#' @export
#' @rdname punk_random
punk_randoms <- function(n = 5) {

   map_df(
      1:5,
      ~ slow_punk_random()
   )

}
