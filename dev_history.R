usethis::use_build_ignore("dev_history.R")

usethis::use_package("jsonlite")
usethis::use_package("assertthat")
usethis::use_vignette("punk_randoms")

attachment::att_to_description()

usethis::use_test("punk_randoms")

usethis::use_news_md()

usethis::use_package("tibble")

usethis::use_package("httr")
usethis::use_package("assertthat")

usethis::use_test("check_results")

usethis::use_vignette(name = "punk_by")
usethis::use_test("punk_by_id")
usethis::use_vignette(name = "summary_method")

