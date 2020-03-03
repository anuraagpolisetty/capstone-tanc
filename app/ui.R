library(shiny)
library(ggplot2)
library(bs4Dash)

fluidPage(
  # navbarPage("Survey Dashboard Tool",
  #   tabPanel("Home"),
  #   tabPanel("Create"),
  #   tabPanel("Data"),
  #   tabPanel("Upload")),
  ui = bs4DashPage(
    navbar = bs4DashNavbar(),
    bs4DashBody(
      shinyjs::useShinyjs(),
      shinyWidgets::chooseSliderSkin("HTML5"),
      bs4TabItems(
        bs4TabItem(
          tabName = "welcome",
          bs4Jumbotron(
            title = "Welcome to the LEGO Mosaic Maker!",
            lead = "This is a Shiny application that lets you convert any picture to a LEGO mosaic directly from the comfort of your web browser!  Once you upload a picture, you can customize many settings.  This app would not be possible without the innovative R scripts created by Ryan Timpe!  Here are links to his excellent blog posts detailing the workflow:",
            list_to_li(
              list(
                tags$a(href = "http://www.ryantimpe.com/post/lego-mosaic1/", "How To: LEGO mosaics from photos using R & the tidyverse"),
                tags$a(href = "http://www.ryantimpe.com/post/lego-mosaic2/", "LEGO mosaics: Two weeks later"),
                tags$a(href = "http://www.ryantimpe.com/post/lego-mosaic3/", "LEGO mosaics: Part 3(D)")
              )
            ),
            status = "primary",
            btn_name = "App GitHub Repository",
            href = "https://gitlab.com/rpodcast/shinylego"
          )
        )
      )
    )
  )
)
    # Use this styling to move on tab over. How to move the rest?
    # tags$head(tags$style('.navbar-nav {width: 95%;}
    #                       .navbar-nav :first-child{float:right}')))
  
  # titlePanel("Single Senior Center"),
  # 
  # sidebarPanel(
  #   
  #   sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
  #               value=min(1000, nrow(dataset)), step=500, round=0),
  #   
  #   selectInput('x', 'X', names(dataset)),
  #   selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
  #   selectInput('color', 'Color', c('None', names(dataset))),
  #   
  #   checkboxInput('jitter', 'Jitter'),
  #   checkboxInput('smooth', 'Smooth'),
  #   
  #   selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
  #   selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  # ),
  # 
  # mainPanel(
  #   plotOutput('plot')
  # )
