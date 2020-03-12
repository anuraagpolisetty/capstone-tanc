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
install.packages("devtools")
devtools::install_github("dkahle/ggmap", ref = "tidyup", force=TRUE)

#Load the library
library("ggmap")

#Set Maps API Key
ggmap::register_google(key = "AIzaSyC0DaJT7v6nAO7uBxGsBdDzzhagOsNXwXo")

p <- ggmap(get_googlemap(center = c(lon = -122.335167, lat = 47.608013),
                         zoom = 11, scale = 2,
                         maptype ='roadmap',
                         color = 'color'))

p


# old map
world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

ggplot(data = world) +
  geom_sf() +
  coord_sf(xlim = c(-124, -121), ylim = c(47, 48))
