
# Reading in data (windows) ----
# Data must be in clipboard from website
input = readLines("clipboard")

# Saving data for future reference
writeLines(as.character(input),
           here::here("2021", "Day 3", "Inputs", "at_day3_input.txt"))


# Data prep ----
input_l = lapply(strsplit(input, "", fixed = TRUE), as.integer)
input_m = do.call(rbind, input_l)


# Part 1 ----
most_common_idx = colMeans(input_m) >= .5

most_common = as.integer(most_common_idx)
least_common = as.integer(!most_common_idx)

gamma = strtoi(paste0(most_common, collapse = ""), base = 2)
epsilon = strtoi(paste0(least_common, collapse = ""), base = 2)

gamma * epsilon

# Part 2 ----

life_support_efficiency = function(m, val_type = c("most common", "least common")) {
  
  val_type = match.arg(val_type, c("most common", "least common"))

  for(i in seq_along(m)) {

    value_to_match = mean(m[, i]) >= .5
  
    if(val_type == "least common") {
      value_to_match = !value_to_match
    }
    
    col_i_matches = m[, i] == as.integer(value_to_match)
    m = m[col_i_matches, ]
    
    if(sum(col_i_matches) <= 1) break
  }
  
  strtoi(paste0(m, collapse = ""), base = 2)
}

ox_gen_rating = life_support_efficiency(input_m, "most common")
co2_scrub_rating = life_support_efficiency(input_m, "least common")

ox_gen_rating * co2_scrub_rating






