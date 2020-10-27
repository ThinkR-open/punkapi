

#' punk_random
#'
#' @param path_api a valid API URL
#'
#' @return a dataframe with plenty of information about a random famous beer
#' @export
#' @import assertthat jsonlite
#' @examples
#' punk_randoms(path_api = "https://api.punkapi.com/v2/beers/random")

punk_randoms <- function(path_api) {

 if (missing(path_api)) {
   message("No path_api passed. api.punkapi is chosen by default ")
   path_api <- "https://api.punkapi.com/v2/beers/random"

 }

 assert_that(is.character(path_api))

 if (!grepl(pattern = "^https://", path_api)){
   stop("path_api is not a valid URL")
 }


  json_list <- read_json(path = path_api)

  df <- data.frame(t(unlist(json_list)))

  return(df)
}

