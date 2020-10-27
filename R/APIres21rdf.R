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
 dfout <- tibble::tibble(
  id= df$id,
  name= df$name,
  tagline= df$tagline,
  first_brewed= df$first_brewed,
  description= df$description,
  image_url= df$image_url,
  abv= df$abv,
  ibu= df$ibu,
  target_fg= df$target_fg,
  target_og= df$target_og,
  ebc= df$ebc,
  srm= df$srm,
  ph= df$ph,
  attenuation_level= df$attenuation_level,
  volume= list(df$volume),
  boil_volume= list(df$boil_volume),
  method= list(df$method),
  ingredients= list(df$ingredients),
  food_pairing= list(df$food_pairing),
  brewers_tips= df$brewers_tips,
  contributed_by= df$contributed_by
)
  return(dfout)
}
