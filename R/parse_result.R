#' API result to 1-row data frame
#'
#' @param content Content from an API request
#'
#' @return A dataframe containing the API request data
#' @noRd
#'
#' @importFrom tibble tibble
#' @importFrom purrr %||%
#'
#' @examples
#' library(httr)
#' res <- GET("https://api.punkapi.com/v2/beers/1")
#' parse_result(content(res)[[1]])
parse_result <- function(content) {
  res <- tibble(
    id = content$id %||% NA,
    name = content$name %||% NA,
    tagline = content$tagline %||% NA,
    first_brewed = content$first_brewed %||% NA,
    description = content$description %||% NA,
    image_url = content$image_url %||% NA,
    abv = content$abv %||% NA,
    ibu = content$ibu %||% NA,
    target_fg = content$target_fg %||% NA,
    target_og = content$target_og %||% NA,
    ebc = content$ebc %||% NA,
    srm = content$srm %||% NA,
    ph = content$ph %||% NA,
    attenuation_level = content$attenuation_level %||% NA,
    volume = list(content$volume) %||% NA,
    boil_volume = list(content$boil_volume) %||% NA,
    method = list(content$method) %||% NA,
    ingredients = list(content$ingredients) %||% NA,
    food_pairing = list(content$food_pairing) %||% NA,
    brewers_tips = content$brewers_tips %||% NA,
    contributed_by = content$contributed_by %||% NA
  )

   class(res) <- c("beer", class(res))


  res

}

#' API results to 1-row data frame
#'
#' @param content Content from an API request
#'
#' @return A dataframe containing the API request data
#' @noRd
#'
#' @importFrom purrr map_df
#'
#' @examples
#' library(httr)
#' res <- GET("https://api.punkapi.com/v2/beers/")
#' parse_results(content(res))
parse_results <- function(lst) {
  map_df(
    lst,
    parse_result
  )
}
