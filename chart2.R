# Load raw data.
prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Load two libraries here for drawing graphs and data manipulation.
library(ggplot2)
library(dplyr)

# Get the data of total population and prison population in WA yearly.
prison_pop_WA2 <- prison_pop %>% 
  filter(state == "WA") %>%
  na.omit() %>%
  group_by(year) %>%
  summarize(total_pop_WA = sum(total_pop), 
            total_prison_pop_WA = sum(total_prison_pop))

# Present the scatter plot.
ggplot(prison_pop_WA2, aes(x = total_pop_WA, y = total_prison_pop_WA)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) + 
  labs(title = "Relation Between the Population and Prison Population in WA",
       x = "Population", y = "Prison Population") + 
  theme(plot.title = element_text(hjust = 0.4))