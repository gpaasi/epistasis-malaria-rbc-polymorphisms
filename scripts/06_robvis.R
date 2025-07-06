#!/usr/bin/env Rscript
# 06_robvis.R
# Purpose: Visualize risk-of-bias assessments using robvis.
#
# Usage:
#   Rscript scripts/06_robvis.R
#
# Dependencies:
#   - readr
#   - robvis

library(readr)
library(robvis)

# Read risk-of-bias data
# Expects data/raw/rob_assessment.csv with columns appropriate for robvis
rob_data <- read_csv("data/raw/rob_assessment.csv")

# Create figures directory if it doesn't exist
if (!dir.exists("figures")) {
  dir.create("figures", recursive = TRUE)
}

# Generate traffic light plot (Figure 2)
rob_traffic_light(data = rob_data,
                  tool = "ROBINS-I",
                  output = "figures/figure2_rob_traffic.png")

# Generate summary plot (Figure 3)
rob_summary(data = rob_data,
            tool = "ROBINS-I",
            output = "figures/figure2_rob_summary.png")

message("Risk-of-bias figures saved to figures/figure2_rob_*.png")
