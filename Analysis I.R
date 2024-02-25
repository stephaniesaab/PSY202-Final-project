#Final Project Results and analysis
# Author: Stephanie Saab
# Date: March 1, 2024





#DRAFT 1
# Include measures like
# - mean
# - median
# - standard deviation
# - range 
# - frequency counts for qualitative data
# - Descriptive stats for IV and DV
# - Present data in tables
# 
# Correlation analysis
# - Math and a DV
# - English and a DV
# - correlation analysis between2 DVs (pairwise correlation analyses)
# - Pearsons r value?
# 
# Between subject ANOVA
# - 2 sets of between ANOVAs, to compare group means across different categorical variables
# - F values, df, p values
# - determine whether there is a difference in the IV on the DV
# - select math_cat and english_cat and test it against ALL DVs
# 
# Data visualization
# - integrate relevant plots and graphs to visualize data
# - clearly label each variable with description of what it represents
# - three scatter plots for correlation
# - 1 density plot for description of DV measures
# - 2 bar plots for ANOVA analysis

#======================= Packages ==============================================
library(dplyr)
library(tidyverse)

data_set <- read.csv("finalDataSet (2).csv")

#================= Descriptive stats ===========================================
