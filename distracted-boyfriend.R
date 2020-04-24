library(tidyverse)
library(ggpattern)

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
  colour = "#2F2C23"
)

clothes_2 <-tibble(
  x = c(22:34, 30, 31),
  y = c(rep(0, 6), 5, 10, 10, 10, 0, 0, 0, 0, 0),
  h = c(1, 4, 14, 18, 18, 19, 15, 10, 8, 7, 16, 16, 11, 4, 6),
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
person_2 <- rbind(hair_2, clothes_2, skin_2)
person_3 <- rbind(hair_3, clothes_3, skin_3)

people <- do.call("rbind", list(person_1, person_2, person_3))

ggplot(people) +
  # everything 
  geom_tile(aes(x = x, y = y + h/2, height = h, fill = colour), size = 8.3, show.legend = FALSE) +
  # just shirt_2
  geom_tile_pattern(data = clothes_2,
                    aes(x = x, y = y + h/2, height = h, fill = colour), size = 8.3,
                    show.legend = FALSE,
                    pattern = "crosshatch",
                    pattern_colour  = NA, pattern_fill = "black",
                    pattern_angle = 0,
                    pattern_density = 0.1, pattern_spacing = 0.014
  ) +
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 0, colour = colour), size = 0) + # dummy for the legend
  scale_colour_identity(breaks = c("#A8B7C2", "#4771B7", "#E93223"),
                       labels = c("Doing\nuseful data\nanalysis", "Me\n\n", "Making\nstupid ggplot\nbar charts"),
                       guide = guide_legend(title = "", keyheight = 6, override.aes = list(size = 6, pattern_fill = NA))) +
  scale_fill_identity() +
  scale_x_continuous(breaks = c(0:42), expand = c(0, 0)) +
  scale_y_continuous(breaks = c(seq(0, 30, 5)), minor_breaks = c(0:30), expand = c(0, 0)) +
  labs(title = "Chart Title") +
  coord_fixed(xlim = c(0.5, 42.5), ylim = c(0, 30)) +
  theme_linedraw(base_family = "Calibri") +
  theme(
    legend.text = element_text(size = 18, vjust = -0.6, lineheight = 1.2),
    legend.margin = margin(0, 0, 80, 0),
    plot.background = element_rect(fill = "white", colour = NA),
    panel.border = element_rect(colour = "grey70"),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_text(size = 11),
    panel.grid.major.x = element_blank(),
    plot.title = element_text(size = 18, margin = margin(0, 0, 20, 0), hjust = 0.61),
    plot.margin = margin(0, 5, 0, 20)
  ) +
  ggsave("distracted.png", dpi = 320, width = 9, height = 6)
