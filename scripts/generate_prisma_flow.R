#!/usr/bin/env Rscript
# generate_prisma_flow.R
# Purpose: Generate PRISMA flow diagram from screening counts YAML.
#
# Usage:
#   Rscript scripts/generate_prisma_flow.R
#
# Dependencies:
#   - PRISMAstatement
#   - yaml
#   - ggplot2

# Load libraries
library(PRISMAstatement)
library(yaml)
library(ggplot2)

# Read screening counts
counts <- yaml.load_file("data/processed/screening_counts.yaml")

# Create figures directory if missing
fig_dir <- "figures"
if (!dir.exists(fig_dir)) {
  dir.create(fig_dir, recursive = TRUE)
}

# Generate flow diagram
flow <- prisma_flowdiagram(
  identified          = counts$identified,
  deduplicated        = counts$deduplicated,
  screened            = counts$screened,
  full_text_assessed  = counts$full_text_assessed,
  full_text_excluded  = counts$full_text_excluded,
  included            = counts$included
)

# Save diagram
output_file <- file.path(fig_dir, "figure1_prisma_flow.png")
ggsave(output_file, plot = flow, width = 6, height = 6, dpi = 100)
message("PRISMA flow diagram saved to ", output_file)
