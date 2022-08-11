library(tidyverse)
graph_2 <- ec2 |>
  group_by(state) |> 
  summarize(avg_ec = mean(ec_county),
            pop_state = sum(pop2018)) |> 
  ggplot(aes(x = pop_state, y = avg_ec)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_x_log10(breaks = c(1000000, 10000000),
                labels = c("1,000,0000", "10,000,000")) +
  labs(y = "Average County Economic Connectedness",
       x = "State Population",
       title = "Economic Connectedness and Population in US States",
       subtitle = "Bigger states have counties with lower average economic connectedness.")

write_rds(graph_2, "graph_2.rds")
