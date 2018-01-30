# Load needed packages
library(rgdal)
library(sp)
library(tidyverse)
library(tmap)

# Look in dir with Shapefiles downloaded from Census
dir("Shapefiles")

# Read in the shapefiles, specify a directory and filename (not extensions)
collin <- readOGR(dsn = "Shapefiles", layer = "06000")

# Get a summary of the shape data
summary(collin)


# Read in the downloaded Census Data
dir("Income Data")
data <- read_csv("Income Data/ACS_16_5YR_B19013_with_ann.csv")

# Delete second header row, and convert to numeric data type
data <- data[-1,]
data <- data %>% 
        mutate(HD01_VD01 = as.numeric(HD01_VD01))


# Join the data to the spatial data
names(collin)
names(data)

spat_data <- merge(collin, data, by.x = "GEO_ID", by.y = "GEO.id" )


# Making the maps
tm_shape(spat_data) + tm_fill(col = "HD01_VD01")

my_map <- tm_shape(spat_data) + tm_fill(col = "HD01_VD01")

tmap_mode("view")

my_map


rm(list=ls())




# Part 2 ------------------------------------------------------------------


# Look in dir with Shapefiles downloaded from Census
dir("Shapefiles 2")

# Read in the shapefiles, specify a directory and filename (not extensions)
collin <- readOGR(dsn = "Shapefiles 2", layer = "14000")

# Get a summary of the shape data
summary(collin)


# Read in the downloaded Census Data
dir("Income Data 2")
data <- read_csv("Income Data 2/ACS_16_5YR_B19013_with_ann.csv")

# Delete second header row, and convert to numeric data type
data <- data[-1,]
data <- data %>% 
  mutate(HD01_VD01 = as.numeric(HD01_VD01))

# Join the data to the spatial data
spat_data <- merge(collin, data, by.x = "GEO_ID", by.y = "GEO.id" )


# Making the maps
tm_shape(spat_data) + tm_fill(col = "HD01_VD01")

my_map <- tm_shape(spat_data) + tm_fill(col = "HD01_VD01")

tmap_mode("view")

my_map
















