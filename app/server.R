library(shiny)
library(ggplot2)
library(bs4Dash)
source('scripts/Tabitha_Analysis.R')


function(input, output) {
  
  output$timeplot <- renderPlot({
    
    grouped_data <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count = n())
    
    ggplot(grouped_data, aes(x=reorder(Do.more.volunteer.work, -count),count))+geom_bar(stat="identity")
    
  })
}