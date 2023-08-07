# Load raw data.
prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Load two libraries here for drawing graphs and data manipulation.
library(ggplot2)
library(dplyr)
library(maps)
library(stringr)

# Load the data of the states of U.S.
prison_pop_16 <- prison_pop %>%
  filter(year == 2016) %>%
  group_by(state) %>%
  summarize(states_prison_pop = sum(total_prison_pop, na.rm = TRUE))

# Load the data of map.
us_map <- map_data("state")
us_map$region <- toupper(str_sub(us_map$region, 1, 2))
map_prison_pop <- left_join(us_map, prison_pop_16,
                            by = c("region" = "state"))

# Present the map.
ggplot(data = map_prison_pop, aes(x = long, y = lat, group = group, fill = states_prison_pop)) +
  geom_polygon(color = "black") +
  coord_fixed(1.3) +
  theme_void() +
  scale_fill_gradient(name = "Prison Population", low = "green", high = "red") +
  labs(title = "The U.S. Map with Prison Population in 2016") +
  theme(plot.title = element_text(hjust = 0.5))