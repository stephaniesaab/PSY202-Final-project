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
library(tidyr)
library(ggplot2)

data_set <- read.csv("finalDataSet (2).csv")

#================= Descriptive stats ===========================================

#Remove NA entries
data_set <- na.omit(data_set)

#Mean and median for continuous variables (age, math, career, english)
data_cont <- select(data_set, c('Age', 'English', 'Math', 'Career'))
means <- as.data.frame(sapply(data_cont, mean))
medians <- as.data.frame(sapply(data_cont, median))
ranges <- sapply(data_cont, range)
sd <- as.data.frame(sapply(data_cont, sd))
desc_cont <- data.frame( 
                                mean = means, 
                                median = medians,
                                range = ranges, 
                                sdev = sd
)

#Frequency counts and mode for categorical variables (Intl, Eng_cat, Math_cat, Car_cat)
data_cat <- select(data_set, c('Intl', 'Eng_cat', 'Math_cat', 'Car_cat'))
freq_intl <- data_cat %>% count(Intl)
freq_eng <- count(data_cat, Eng_cat)
freq_math <- count(data_cat, Math_cat)
freq_car <- count(data_cat, Car_cat)

#============================== Correlation analysis ===========================
#1: Math and Cognitive
#2: English and Value
#3: 2 DVs (difficulty and value)
# IVs (background and demographics): age, International, math, career, english, eng_cat, math_cat, car_cat
#DVs: affect, cognitive, value, difficulty
# - affect = positive and negative feelings concerning stats
# - cognitive = competence-attitudes about intellectual knowledge and skills when applied to stats
# - value - attitudes about the usefulness, relevance, and worth of statistics
# - difficulty - attitudes about the difficulty of statistics as a subject

dat_cor <- select(data_set, c('Math', 'English', 'Affect', 'Cognitive', 'Difficulty', 'Value'))

corr_1_dat <- select(data_set, 'Math', 'Cognitive')
corr_1 <- cor(corr_1_dat, method = 'pearson')

corr_2_dat <- select(data_set, 'English', 'Value')
corr_2 <- cor(corr_2_dat, method = 'pearson')

corr_3_dat <- select(data_set, 'Difficulty', 'Value')
corr_3 <- cor(corr_3_dat, method = 'pearson')

corr_total <- cor(dat_cor, method = 'pearson')
#============================ Graphs ===========================================

heatmap(corr_total, 
        col = colorRampPalette(c('blue', 'white', 'red'))(100),
        symm = TRUE,
        scale = 'none', 
        main = 'Correlation Heatmap', 
        xlab = "Variables", 
        ylab = 'Variables')
#============================== Between-Subject ANOVA ==========================



