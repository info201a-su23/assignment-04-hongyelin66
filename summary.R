# Load the necessary library.
library(dplyr)

# Load the raw data.
prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Codes:
# Max prison population
max_prison_pop <- max(prison_pop$total_prison_pop, na.rm = TRUE)
print(paste("The max total prison population is", max_prison_pop))

# The county with max prison population
max_county <- prison_pop %>% filter(total_prison_pop == max_prison_pop) %>% 
  select(county_name)
print(paste("The county with max total prison population is", max_county))

# The year with max prison population
max_year <- prison_pop %>% filter(total_prison_pop == max_prison_pop) %>% 
  select(year)
print(paste("The year with max total prison population is", max_year))

# The mean prison population of LA county
la_prison <- prison_pop %>% 
  filter(county_name == "Los Angeles County")
mean_la_prison <- as.integer(mean(la_prison$total_prison_pop, na.rm = TRUE))
print(paste("The mean prison population of LA county is", mean_la_prison))

# Min prison population
min_prison_pop <- min(prison_pop$total_prison_pop, na.rm = TRUE)
print(paste("The min total prison population is", min_prison_pop))


