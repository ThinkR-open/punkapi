#' A function that returns a list of beers based on the ebc
#'
#' @param ebcmin
#' @param ebcmax
#'
#' @return a list of beers with ebc larger than ebcmin and less than ebcmax
#' @export
#' @import assertthat
#'
#' @examples
#' out <- punk_by_ebc(5,10)
punk_by_ebc <- function(ebcmin=5, ebcmax=10){
  assert_that(
    is.numeric(ebcmin),
    msg = "ebcmin should be a number"
  )
  assert_that(
    is.numeric(ebcmax),
    msg = "ebcmin should be a number"
  )
  assert_that(
    ebcmin>=0,
    msg = "ebcmin should be larger or equal to zero"
  )
  assert_that(
    ebcmin<=100,
    msg = "ebcmax should be less or equal to 100"
  )
  assert_that(
    ebcmin<=ebcmax,
    msg = "ebcmin should be less or equal to ebcmax"
  )
  res <- httr::GET("https://api.punkapi.com/v2/beers",
                   query = list("ebc_gt" = as.character(ebcmin),
                                "ebc_lt" = as.character(ebcmax)))
  check_results(res)
  ct <- content(res)[[1]]
  out <- parse_results(ct)
  return(out)
}
