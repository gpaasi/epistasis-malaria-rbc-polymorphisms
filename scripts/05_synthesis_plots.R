#!/usr/bin/env Rscript
# 05_synthesis_plots.R
# Purpose: perform the SWiM‐style qualitative synthesis of interaction directions
# Usage:   Rscript scripts/05_synthesis_plots.R
# Dependencies: readr, dplyr, tidyr, ggplot2

library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

# 1. load cleaned data
df <- read_csv("data/processed/included_studies_clean.csv")

# 2. tally directions by genotype_pair × outcome_domain
tab2 <- df %>%
  group_by(genotype_pair, outcome_domain, direction) %>%
  summarise(n = n(), .groups="drop") %>%
  # ensure every combination has a row (fill missing with zero)
  complete(genotype_pair, outcome_domain, direction, fill = list(n = 0))

# write out Table 2
if(!dir.exists("results")) dir.create("results", recursive=TRUE)
write_csv(tab2, "results/table2_interaction_directions.csv")

# 3. graded epistatic landscape (Figure 3)
#    heatmap of counts: black tiles with alpha = n / max(n)
heat_data <- tab2 %>%
  group_by(genotype_pair, outcome_domain) %>%
  summarise(count = sum(n), .groups="drop") %>%
  mutate(alpha = count / max(count))

# plot
p_heat <- ggplot(heat_data, aes(
    x = factor(genotype_pair, 
               levels=unique(genotype_pair)), 
    y = factor(outcome_domain, 
               levels=unique(outcome_domain))
  )) +
  geom_tile(fill="black", aes(alpha=alpha)) +
  scale_alpha(range = c(0.1, 1)) +
  labs(
    x = "Genotype combination",
    y = "Outcome domain",
    title = "Graded epistatic landscape (study counts → opacity)",
    caption = "Tile opacity ∝ number of studies reporting any interaction"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle=45, hjust=1),
    legend.position="none"
  )

if(!dir.exists("figures")) dir.create("figures", recursive=TRUE)
ggsave("figures/figure3_epistatic_landscape.png",
       plot = p_heat, width = 8, height = 6, dpi = 100)

# 4. stacked‐bar summary (Figure 7)
#    for each genotype_pair, show proportion of directions
bar_data <- tab2 %>%
  group_by(genotype_pair, direction) %>%
  summarise(total = sum(n), .groups="drop") %>%
  group_by(genotype_pair) %>%
  mutate(prop = total / sum(total))

p_bar <- ggplot(bar_data, aes(
    x = factor(genotype_pair, levels=unique(genotype_pair)),
    y = prop,
    fill = direction
  )) +
  geom_col() +
  labs(
    x = "Genotype combination",
    y = "Proportion of studies",
    fill = "Interaction direction",
    title = "Distribution of interaction directions by genotype pair"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle=45, hjust=1))

ggsave("figures/figure7_stacked_directions.png",
       plot = p_bar, width = 8, height = 6, dpi = 100)
