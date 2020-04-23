library(tidyverse)

clothes_1 <- tibble(
  x = c(6:18),
  y = 0,
  h = c(rep(10, 3), rep(11, 10)),
  colour = "#E93223"
)

skin_1 <- tibble(
  x = c(4, 5, 9:16, 19, 20),
  y = c(0, 0, 10, rep(9, 5), 10, 10, 0, 0),
  h = c(9, 10, 1, 12, 13, 13, 13, 12, 1, 1, 10, 9),
  colour = "#E2B3A8"
)

hair_1 <- tibble(
  x = c(7:18),
  y = c(10, 10, 11, 21, 22, 22, 22, 21, rep(11, 4)),
  h = c(4, 8, 11, rep(2, 5), 11, 8, 4, 3),
  colour = "#2F2C24"
)

clothes_2 <-tibble(
  x = c(22:34),
  y = 0,
  h = c(1, 4, 14, 18, 18, 19, 20, 20, 18, 17, 16, 16, 11),
  colour = "#4771B7"
)

skin_2 <- tibble(
  x = c(23:27, 28:31),
  y = c(19, 18, 18, 18, 21, 0, 0, 4, 6),
  h = c(5, 6, 6, 5, 1, 5, 10, 6, 4),
  colour = "#E2B3A8"
)

hair_2 <- tibble(
  x = c(23:28),
  y = c(24, 24, 24, 23, 19, 20),
  h = c(1, 1, 1, 2, 6, 3),
  colour = "#674635"
)

clothes_3 <- tibble(
  x = c(36:42),
  y = 0,
  h = c(11, 11, 13, rep(14, 4)),
  colour = "#A8B7C2"
)

hair_3 <- tibble(
  x = c(36:41),
  y = 11,
  h = c(10, 10, 9, 9, 8, 8),
  colour = "#2F2C23"
)

skin_3 <- tibble(
  x = c(35:41, 36:39),
  y = c(0, 0, 1, 2, 4, 7, 11, 17, 15, 14, 14),
  h = c(2, 3, 4, 7, 9, 6, 2, 2, 4, 5, 3),
  colour = "#E2B3A8"
)

person_1 <- rbind(clothes_1, skin_1, hair_1)
person_2 <- rbind(clothes_2, hair_2, skin_2)
person_3 <- rbind(hair_3, clothes_3, skin_3)

people <- do.call("rbind", list(person_1, person_2, person_3))

ggplot(people) +
  geom_segment(aes(x = x, y = y, xend = x, yend = y + h, colour = colour), size = 8.3) +
  scale_color_identity() +
  scale_x_continuous(breaks = c(0:42), expand = c(0, 0)) +
  scale_y_continuous(breaks = c(0:30), expand = c(0, 0)) +
  coord_fixed(ylim = c(0, 30)) +
  theme_linedraw() +
  theme(
    plot.background = element_rect(fill = "white", colour = NA),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    panel.grid.minor = element_blank()
  ) +
  ggsave("distracted.png", dpi = 320)
