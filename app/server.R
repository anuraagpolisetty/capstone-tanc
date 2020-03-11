library(shiny)
library(ggplot2)
library(bs4Dash)
library(rsconnect)
source('scripts/Tabitha_Analysis.R')
source('scripts/GaugeChart.R')

function(input, output) {

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
}