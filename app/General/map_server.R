output$map <- ggmap(get_googlemap(center = c(lon = -122.335167, lat = 47.608013),
                                  zoom = 11, scale = 2,
                                  maptype ='roadmap',
                                  color = 'color'))