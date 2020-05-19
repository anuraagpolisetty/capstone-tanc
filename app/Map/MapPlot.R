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
# install.packages("devtools", type="binary")
# devtools::install_github("dkahle/ggmap", type="binary", ref = "tidyup", force=TRUE)


#Load the library
library("ggmap")

locations <- read.csv("data/Senior_Center_Locations_Cleaned.csv")
names(locations)[1] <- 'SiteName'
means <- locations %>% select(Q1...DoMoreVolunteerWork:Q14...WouldRecommendSeniorCenter)
locations <- locations %>% select(SiteName, lat, long, race_for_center, colnames(locations)[8])

locations$mean.index <- round(rowMeans(means), digits = 2)
#Set Maps API Key
ggmap::register_google(key = "AIzaSyC0DaJT7v6nAO7uBxGsBdDzzhagOsNXwXo")

p <- ggmap(get_googlemap(center = c(lon = -122.335167, lat = 47.608013),
                         zoom = 11, scale = 4,
                         maptype ='roadmap',
                         color = 'color'), extent = "device") + geom_point(aes(x = long, y = lat, color=race_for_center, size = mean.index, text=paste('Site: ', SiteName, '<br>', 'Race: ', race_for_center, "<br>", 'Average Index: ', round(mean.index, digits=2))), alpha=0.4, data = locations, size = 5) +
    theme_minimal()
  # theme(legend.position="bottom", plot.margin=unit(c(0,0,-1,-1), "lines"), axis.line = element_blank(),
  #       axis.text = element_blank(), axis.ticks = element_blank(), plot.background = element_rect(fill="lightgrey"),
  #       panel.background = element_rect(fill="lightgrey"),
  #       panel.grid.major = element_line(size = 0.7, colour = 'white'), 
  #       panel.grid.minor = element_blank()) + xlab("") + ylab("")
p 


