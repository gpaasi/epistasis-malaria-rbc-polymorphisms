.PHONY: all parse flow

all: parse flow

parse:
	Rscript scripts/parse_included_studies.R

flow:
	Rscript scripts/generate_prisma_flow.R
