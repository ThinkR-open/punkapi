#' API result to 1-row data frame
#'
#' @param url
#'
#' @return A 1-row data frame containing the result of the API
#' @export
#'
#' @examples out <- APIres21rdf("https://api.punkapi.com/v2/beers/1")
APIres21rdf <- function (url){
  res <- httr::GET(url)
  df <- httr::content(res)[[1]] # <- Turn this into a data.frame with one row
  dfout <- data.frame(unlist(df))
  return(dfout)
}
