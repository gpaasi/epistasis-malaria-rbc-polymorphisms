# Epistasis in Malaria-Protective RBC Polymorphisms: A Systematic Review

<!-- Project status badges -->
[![Release](https://img.shields.io/github/v/release/gpaasi/epistasis-malaria-rbc-polymorphisms.svg)](https://github.com/gpaasi/epistasis-malaria-rbc-polymorphisms/releases/latest)
[![CI](https://github.com/gpaasi/epistasis-malaria-rbc-polymorphisms/actions/workflows/ci.yml/badge.svg)](https://github.com/gpaasi/epistasis-malaria-rbc-polymorphisms/actions/workflows/ci.yml)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15825231.svg)](https://doi.org/10.5281/zenodo.15825231)
[![License: CC-BY-4.0](https://img.shields.io/badge/License-CC--BY--4.0-lightgrey.svg)](LICENSE.md)
 

---

## Table of Contents

1. [Overview](#overview)  
2. [Repository structure](#repository-structure)  
3. [Data description](#data-description)  
4. [Installation & environment setup](#installation--environment-setup)  
5. [Workflow 1: Data preparation & RoB tables](#workflow-1-data-preparation--rob-tables)  
6. [Workflow 2: Figures & PRISMA flow](#workflow-2-figures--prisma-flow)  
7. [Running the full pipeline](#running-the-full-pipeline)  
8. [How to cite](#how-to-cite)  
9. [License](#license)  
10. [Contact information](#contact-information)  

---

## Overview

This repository contains all materials, data, code, and documentation for a **systematic review** of **epistatic interactions** among co-inherited malaria-protective red blood cell (RBC) polymorphisms. Our objectives are to:

- **Characterise** how host genotypes (e.g., HbAS, α⁺-thalassaemia, G6PDd, CR1 Sl₂/McCᵇ, Hp2-1, PIEZO1, PKLR) interact to modify malaria risk.  
- **Synthesize** epidemiological evidence across outcome domains from asymptomatic infection, parasite density, uncomplicated and severe clinical malaria, through mortality.  
- **Inform** genetic risk prediction, trial stratification, and combination intervention design.  

---

## Repository structure

```txt
epistasis-review/
├── README.md                   ← this file
├── LICENSE.md                  ← CC BY 4.0 license
├── CITATION.cff                ← CFF citation file
├── zenodo.json                 ← Zenodo metadata
├── .gitignore                  ← ignore patterns
├── Makefile                    ← build targets
│
├── data/                       ← raw and processed data files
│   ├── raw/                    ← unmodified input files
│   └── processed/              ← cleaned data for analysis
│
├── scripts/                    ← R scripts for data cleaning, synthesis, and visualization
│
├── figures/                    ← generated figures and README for figures
│
├── supplementary/              ← supplementary tables and PDFs
│
├── docs/                       ← contributing guide, code of conduct, citation guide
│
└── .github/                    ← CI workflows and GitHub templates
```  

---

## Data description

- **data/raw/**: Original exports of search strategies, screening logs, extraction tables.  
- **data/processed/**: Outputs from cleaning scripts (`parse_included_studies.R` and `generate_prisma_flow.R`).  

---

## Installation & environment setup

Clone the repo and install R (≥ 4.2.0) with required packages:

```bash
git clone https://github.com/<YOUR_USER>/epistasis-review.git
cd epistasis-review
Rscript -e 'install.packages(c("readxl","janitor","dplyr","PRISMAstatement","yaml","ggplot2","readr","tidyr","robvis"), repos="https://cloud.r-project.org")'
```

---

## Workflow 1: Data preparation & RoB tables

Run:

```bash
make parse
```

This invokes `scripts/parse_included_studies.R` to clean raw data.

---

## Workflow 2: Figures & PRISMA flow

Run:

```bash
make flow
```

This invokes `scripts/generate_prisma_flow.R` to produce the PRISMA diagram.

---

## Running the full pipeline

```bash
make all
```

This runs parse and flow targets in sequence.

---

## How to cite

Paasi G, Namazzi R, Asiimwe G, et al. Epistatic interactions among co-inherited malaria-protective RBC polymorphisms: a systematic review. 2025. Zenodo DOI: 10.5281/zenodo.15689409

---

## License

This work is licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) — see LICENSE.md for details.

---

## Contact information

George Paasi  
Department of Paediatrics and Child Health, Makerere University  
Email: georgepaasi8@gmail.com
