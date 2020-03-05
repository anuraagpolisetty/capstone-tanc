library(shiny)
library(ggplot2)
library(bs4Dash)
library(plotly)

data <- read.csv("C:/Users/Tabit/OneDrive/Capstone/capstone-tanc/data/Total.csv")
test <- unique(data$SiteID)
filtered <- filter(data, SiteID == "GWP")
#View(filtered)

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
          'Single Centers',
          tabName = 'create',
          icon = 'info'
        ), 
        bs4SidebarMenuItem(
          'Comparing Centers',
          tabName = 'compare',
          icon = 'info'
        ),
        bs4SidebarMenuItem(
          'General Info',
          tabName = 'general',
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
              tabName = 'create',
              gradientColor = 'primary'
            ),
            plotlyOutput("gauge")
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
            titlePanel('Pike Market Senior Center'),
            bs4Card(
              title = 'Index for Pike Market Senior Center',
              plotlyOutput("social"),
              plotlyOutput("physical"),
              plotlyOutput("positive"),
              plotlyOutput("services"),
              plotlyOutput("independence"),
              plotlyOutput("general")
            ),
            selectInput("select", label=h3('Pick a Sector to Evaluate'),
                        choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                        selected = 1),
            bs4Card(
              title = "Over Time",
              width = 12,
              collapsible = TRUE,
              plotOutput("timeplot")
            ),
            bs4Card(
              title = "Response for Sector",
              width = 12,
              collapsible = TRUE,
              plotOutput("single_center_bar")
            )
          ),
          bs4TabItem(
            tabName = 'compare',
            # Application title
            titlePanel("Survey Questions"),
            
            # Sidebar with a slider input for number of bins 
            sidebarPanel(
              radioButtons("question",
                           "Select Question",
                           choices = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"),
                           selected = "1"),
              plotOutput("bar"),
              selectInput(
                "select",
                label = h3("Filter on site"),
                choices = c("All", "ACRS", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", "Wallingford", "CISC", "South Park", "GWP", "Southeast")
              ),
              plotOutput("income")
            ),
            mainPanel(
              plotOutput("bar"),
              plotOutput("income")
            )
            
          )
        )
      )
    )
  )