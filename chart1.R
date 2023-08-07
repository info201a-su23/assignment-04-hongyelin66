# Load raw data.
prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Load two libraries here for drawing graphs and data manipulation.
library(ggplot2)
library(dplyr)

# Get the data of prison population of races in WA.
prison_pop_WA <- prison_pop %>% 
  filter(state == "WA") %>%
  na.omit() %>%
  group_by(year) %>%
  summarize(black_prison_pop = sum(black_prison_pop), 
            latinx_prison_pop = sum(latinx_prison_pop),
            white_prison_pop = sum(white_prison_pop),
            native_prison_pop = sum(native_prison_pop),
            other_race_prison_pop = sum(other_race_prison_pop))

# Present the line plot.
ggplot() + 
  geom_line(data = prison_pop_WA, aes(x = year, y = 
                                        black_prison_pop, color = "Black")) + 
  geom_line(data = prison_pop_WA, aes(x = year, y = 
                                        latinx_prison_pop, color = "Latinx")) +
  geom_line(data = prison_pop_WA, aes(x = year, y = 
                                        white_prison_pop, color = "White")) +
  geom_line(data = prison_pop_WA, aes(x = year, y = 
                                        native_prison_pop, color = "Native")) +
  geom_line(data = prison_pop_WA, aes(x = year, y = 
                                        other_race_prison_pop, color = 
                                        "Others")) +
  scale_color_manual(values = c(Black = "red", Latinx = "blue", White = "green",
                                Native = "orange", Others = "black")) +
  labs(x = "Year", y = "Population", color = "Race") + 
  ggtitle("The Total Prison Population of Races in WA
          1990 - 2016") + 
  theme(plot.title = element_text(hjust = 0.5))