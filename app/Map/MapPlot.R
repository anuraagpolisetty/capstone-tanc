library("ggplot2")
theme_set(theme_bw())
library("sf")
library(lubridate)
library(dplyr)
library(data.table)
library(ggrepel)
library(tidyverse)

#Get the latest Install
# if(!requireNamespace("devtools")) 
install.packages("devtools", type="binary")
devtools::install_github("dkahle/ggmap", type="binary", ref = "tidyup", force=TRUE)

#Load the library
library("ggmap")

locations.data <- read.csv("data/Senior_Center_Locations_Cleaned.csv")
locations <- locations.data %>% select(SiteName,lat, long, race_for_center)


#Set Maps API Key
ggmap::register_google(key = "AIzaSyC0DaJT7v6nAO7uBxGsBdDzzhagOsNXwXo")

p <- ggmap(get_googlemap(center = c(lon = -122.335167, lat = 47.608013),
                         zoom = 11, scale = 2,
                         maptype ='roadmap',
                         color = 'color')) + geom_point(aes(x = long, y = lat, color=race_for_center), alpha=0.4,data = locations, size = 5) +
  theme(legend.position="bottom" )
p 

