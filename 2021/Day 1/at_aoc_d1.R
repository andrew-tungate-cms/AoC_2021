

# Reading in data (windows)
# Data must be in clipboard from website
input = readLines("clipboard")
input = as.integer(input)

# Part 1
depth_increase = diff(input) > 0
sum(depth_increase)

# Part 2
input_window = data.table::frollsum(input, 3, align = "center")
depth_increase_window = diff(input_window) > 0
sum(depth_increase_window, na.rm = TRUE)


# Saving data for future reference
writeLines(as.character(input),
           here::here("2021", "Day 1", "Inputs", "at_day1_input.txt"))