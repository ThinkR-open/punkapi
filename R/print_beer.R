#' Printing method for beers
#'
#' @param x tibble got from a punk_xxx function
#' @param ...
#'
#' @return print the beer characteristics
#' @export
#' @importFrom cli cat_rule cat_bullet cat_line
#' @importFrom purrr walk
#'
#' @examples
#' res <- punk_by_id(id = 1)
#' print(res)
print.beer <- function(x, ...) {
  # browser()
  print_beer_by_row <- function(.row) {

    cat_rule(.row["name"])
    cat_bullet(.row["tagline"])
    cat_line(.row["description"])

  }

  apply(x, MARGIN = 1, FUN = print_beer_by_row)


}


