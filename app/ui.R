library(shiny)
library(ggplot2)
library(bs4Dash)
library(plotly)

fluidPage(
  bs4DashPage(
    title = 'Survey Visualization Tool',
    sidebar_collapsed = FALSE,
    
    # Navbar on top
    navbar = bs4DashNavbar(
      skin = 'dark',
      status = 'primary'
    ),
    
    # left sidebar
    sidebar = bs4DashSidebar(
      skin = "dark",
      status = 'primary',
      title = 'Survey Visualization Tool',
      
      bs4SidebarMenu(
        bs4SidebarMenuItem(
          'Home',
          tabName = 'home',
          icon = 'info'
        ),
        bs4SidebarMenuItem(
          'Tabitha/Anuraag Visuals',
          tabName = 'create',
          icon = 'info'
        ), 
        bs4SidebarMenuItem(
          'Data',
          tabName = 'data',
          icon = 'info'
        )
      )
    ),
    
    
    bs4DashBody(
      shinyjs::useShinyjs(),
      shinyWidgets::chooseSliderSkin("HTML5"),
      bs4TabItems(
        bs4TabItem(
          tabName = "home",
          bs4UserCard(
            title = "Pike Market Senior Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'data',
              gradientColor = 'primary'
            )
            ),
          bs4UserCard(
            title = "Wallingford Senior Center",
            width = 12,
            status = 'primary',
            bs4InfoBox(
                title = 'View Data',
                tabName = 'View Data',
                gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "Greenwood Senior Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'View Data',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "South Park Senior Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'View Data',
              gradientColor = 'primary'
            )
          )
          ),
          bs4TabItem(
            tabName = 'create',
            selectInput("select", label=h3('Select box'),
                        choices = list('Question 1' = 1, 'Question 2' = 2),
                        selected = 1),
            bs4Card(
              title = "Over Time",
              width = 12,
              collapsible = TRUE,
              plotOutput("timeplot")
            )
          ),
          bs4TabItem(
            tabName = 'data'
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
