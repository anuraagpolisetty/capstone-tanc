# Server used to host the application. 
# Creates the plots displayed to the user and considers user input. 

library(plotly)
library(shiny)
library(ggplot2)
library(ISOcodes)
library(bs4Dash)
library(rsconnect)
source('scripts/Tabitha_Analysis.R')
source('scripts/GaugeChart.R')
source('Map/MapPlot.R')




function(input, output, session) {
  source('Single_Center/pike_server.R', local = T)
  source('Single_Center/wallingford_server.R', local = T)
  source('Single_Center/greenwood_server.R', local = T)
  source('Single_Center/southpark_server.R', local = T)
  source('Single_Center/idic_server.R', local = T)
  source('Single_Center/southeast_server.R', local = T)
  source('Single_Center/sunshine_server.R', local = T)
  source('Single_Center/acrs_server.R', local = T)
  source('Single_Center/gwp_server.R', local=T)
  source('Compare/compare_server.R', local=T)

  source('Survey/Survey.R', local = T)
  output$map <- renderPlotly({
    p
  })
  
  
  
}
