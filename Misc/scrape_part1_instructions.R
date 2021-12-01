

scrape_pt1 = function(day = NULL, year = NULL) {

  if(is.null(manual_day)) {
    day = as.integer(format(Sys.Date(), format = "%d"))
  }
  if(is.null(year)) {
    year = format(Sys.Date(), format = "%Y")
  }
  
  file_name = paste0("day", day, "part1_instructions.txt")
  
  # Scraping the instructions for day 1
  html_page = rvest::read_html(paste0("https://adventofcode.com/2021/day/", day))
  
  html_page %>%
    rvest::html_element("body > main > article") %>%
    rvest::html_text2() %>%
    writeLines(here::here(year, paste0("Day ", day), file_name))
  
}

scrape_pt1()

