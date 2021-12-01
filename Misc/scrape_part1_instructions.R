



library(rvest)

manual_day = NULL
year = format(Sys.Date(), format = "%Y")


if(!is.null(manual_day)) {
  day = manual_day
} else {
  day = as.integer(format(Sys.Date(), format = "%d"))
}


file_name = paste0("day", day, "part1_instructions.txt")


html_page = read_html(paste0("https://adventofcode.com/2021/day/", day))


html_page %>%
  html_element("body > main > article") %>%
  html_text2() %>%
  writeLines(here::here(year, paste0("Day ", day), file_name))





