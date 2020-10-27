#' Checks that the result is a 200 status code.
#'
#' @param requete requete sur l'API punk
#'
#' @return un booleen (status = 200 : TRUE / FALSE)
#' @export
#' @importFrom httr status_code
#' @importFrom assertthat assert_that
#'
#' @examples
#' requete <- httr::GET("https://api.punkapi.com/v2/beers/1")
#' check_results(requete = requete)
check_results <- function(requete) {

  assert_that(status_code(requete) == 200)


}
