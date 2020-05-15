library(plotly)
source("./IndexData.R")

allData <- read.csv(file="./data/TOTAL.csv", stringsAsFactors=FALSE)

data.2019 <- IndexData(allData) %>% filter(Batch=="2019-1"|Batch=="2019-2")
social.index.2019 <- SocialIndex(data.2019, "all")

data.2018 <- IndexData(allData) %>% filter(Batch=="2018-1"|Batch=="2018-2")
social.index.2018 <- SocialIndex(data.2018, "all")

social.index <- SocialIndex(data.2019, "all")
physical.index <- PhysicalIndex(data.2019, "all")
positive.index <- PositiveIndex(data.2019, "all")
services.index <- ServicesIndex(data.2019, "all")
independence.index <- IndependenceIndex(data.2019, "all")
satisfaction.index <- OverallIndex(data.2019, "all")

GaugeChart <- function(data, FUN, site, year, colored, title) {

  yr1 <- paste0(year,"-1")
  yr2 <- paste0(year, "-2")
  index <- (FUN(data, site))
  # print(year)
  
  if(substr(year, 6, 6) == '1') {
    new.year <- paste0(as.character(as.numeric(substr(year, 1, 4)) - 1), '-2')
  }
  else if(substr(year, 6,6) == '2') {
    new.year <- gsub('-2', '-1', year)
  }
  
  delta <-
  
  fig <- plot_ly(
    domain = list(x = c(0, 1), y = c(0, 1)),
    value = index,
    title = title,
    type = "indicator",
    mode = "gauge+number+delta",
    delta = list(reference = social.index.2018),
    width = '250',
    height = '190',
    gauge = list(
      axis =list(range = list(NULL, 3)),
      bar = list(color="lightgreen")
      # steps = list(
      #   list(range = c(0, 250), color = "red"),
      #   list(range = c(250, 400), color = "yellow"),
      #   list(range = c(400, 500), color = "green"))
      # threshold = list(
      #   line = list(color = "red", width = 4),
      #   thickness = 0.75,
      #   value = 490)
    ))
  fig <- fig %>%
  #   layout(margin = list(l=20,r=30),
  #          autosize = F, width = '250', height = '190') %>% 
  #   #layout(plot_bgcolor='rgb(254, 247, 234)') 
    layout(paper_bgcolor=colored)
  return(fig)
}

# social = GaugeChart(data.2019, SocialIndex, "all", "2019", 'rgb(255, 255, 255)',"Chart")
# physical = GaugeChart(data.2019, PhysicalIndex, "all", "2019")
# positive = GaugeChart(data.2019, PositiveIndex, "all", "2019")
# services = GaugeChart(data.2019, ServicesIndex, "all", "2019")
# independence = GaugeChart(data.2019, IndependenceIndex, "all", "2019")
# plot = GaugeChart(data.2019, OverallIndex, "all", "2019")

