#' A function that returns a list of beers based on the ibu
#'
#' @param ibumin
#' @param ibumax
#'
#' @return a list of beers with ibu larger than ibumin and less than ibumax
#' @export
#' @import assertthat
#'
#' @examples
#' out <- punk_by_ibu(10,20)
punk_by_ibu <- function(ibu_gt=10, ibu_lt=20){
  assert_that(
    is.numeric(ibumin),
    msg = "ibumin should be a number"
  )
  assert_that(
    is.numeric(ibumax),
    msg = "ibumax should be a number"
  )
  assert_that(
    ibumin>=0,
    msg = "ibumin should be larger or equal to zero"
  )
  assert_that(
    ibumax<=100,
    msg = "ibumax should be less or equal to 100"
  )
  assert_that(
    ibumin<=ibumax,
    msg = "ibumin should be less or equal to ibumax"
  )
  res <- httr::GET("https://api.punkapi.com/v2/beers",
                   query = list("ibu_gt" = as.character(ibumin),
                                "ibu_lt" = as.character(ibumax)))

  check_results(res)

res <-  parse_results(res)

  return(res)


}

