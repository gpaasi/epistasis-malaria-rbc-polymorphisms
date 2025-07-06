#!/usr/bin/env Rscript
# parse_included_studies.R
# Purpose: Clean raw included studies extraction table and create analysis-ready CSV.
#
# Usage:
#   Rscript scripts/parse_included_studies.R
#
# Dependencies:
#   - readxl
#   - janitor
#   - dplyr

# Load libraries
library(readxl)
library(janitor)
library(dplyr)

# Read raw data
raw_path <- "data/raw/included_studies_raw.xlsx"
raw <- read_excel(raw_path)

# Clean column names
cleaned <- raw %>%
  clean_names() %>%
  # Convert numeric fields
  mutate(
    sample_size = as.integer(sample_size),
    effect_estimate = as.numeric(effect_estimate),
    lower_ci = as.numeric(lower_ci),
    upper_ci = as.numeric(upper_ci)
  )

# Write cleaned data
output_path <- "data/processed/included_studies_clean.csv"
write.csv(cleaned, output_path, row.names = FALSE)
message("Cleaned data written to ", output_path)
