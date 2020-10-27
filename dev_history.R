usethis::use_build_ignore("dev_history.R")

usethis::use_package("jsonlite")
usethis::use_package("assertthat")
usethis::use_vignette("punk_randoms")

attachment::att_to_description()

usethis::use_test("punk_randoms")

