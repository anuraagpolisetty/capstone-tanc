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
          'Single Centers',
          tabName = 'single',
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
              tabName = 'single',
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
              tabName = 'wallingford',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "Greenwood Senior Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'greenwood',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "South Park Senior Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'southpark',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "International Drop-In Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'idic',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "Southeast Seattle Senior Center",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'southeast',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "Sunshine Garden (Chinese Information and Service Center)",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'sunshine',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "ACRS",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'acrs',
              gradientColor = 'primary'
            )
          ),
          bs4UserCard(
            title = "GWP",
            width = 12,
            bs4InfoBox(
              title = 'View Data',
              tabName = 'gwp',
              gradientColor = 'primary'
            )
          )
        ),
        bs4TabItem(tabName = 'single',
                   bs4TabSetPanel(
                     id = 'tabset1',
                     side = 'right',
                     bs4TabPanel(tabName = 'Pike Market',
                                 titlePanel('Pike Market Senior Center'),

                                 selectInput("pike_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for Pike Market Senior Center',
                                   closable=FALSE,
                                   plotlyOutput("social_pike"),
                                   plotlyOutput("physical_pike"),
                                   plotlyOutput("positive_pike"),
                                   plotlyOutput("services_pike"),
                                   plotlyOutput("independence_pike"),
                                   plotlyOutput("general_pike")
                                 ),
                                 
                                 selectInput("pike_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("pike_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("pike_bar")
                                 )
                     ),
                     bs4TabPanel(tabName = 'Wallingford',
                                 titlePanel('Wallingford Senior Center'),
                                 selectInput("wallingford_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for Wallingford Senior Center',
                                   closable=FALSE,
                                   plotlyOutput("social_wallingford"),
                                   plotlyOutput("physical_wallingford"),
                                   plotlyOutput("positive_wallingford"),
                                   plotlyOutput("services_wallingford"),
                                   plotlyOutput("independence_wallingford"),
                                   plotlyOutput("general_wallingford")
                                 ),
                                 
                                 selectInput("wallingford_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("wallingford_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("wallingford_bar")
                                 )),
                     bs4TabPanel(tabName = 'Greenwood',
                                 titlePanel('Greenwood Senior Center'),
                                 selectInput("greenwood_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for Greenwood Senior Center',
                                   closable=FALSE,
                                   plotlyOutput("social_greenwood"),
                                   plotlyOutput("physical_greenwood"),
                                   plotlyOutput("positive_greenwood"),
                                   plotlyOutput("services_greenwood"),
                                   plotlyOutput("independence_greendwood"),
                                   plotlyOutput("general_greenwood")
                                 ),
                                 
                                 selectInput("greenwood_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("greenwood_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("greenwood_bar")
                                 )),
                     bs4TabPanel(tabName = 'South Park',
                                 titlePanel('South Park Senior Center'),
                                 selectInput("southpark_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for South Park Senior Center',
                                   closable=FALSE,
                                   plotlyOutput("social_southpark"),
                                   plotlyOutput("physical_southpark"),
                                   plotlyOutput("positive_southpark"),
                                   plotlyOutput("services_southpark"),
                                   plotlyOutput("independence_southpark"),
                                   plotlyOutput("general_southpark")
                                 ),
                                 
                                 selectInput("southpark_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("southpark_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("southpark_bar")
                                 )),
                     bs4TabPanel(tabName = 'IDIC',
                                 titlePanel('International Drop-In Center'),
                                 selectInput("idic_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for International Drop-In Center',
                                   closable=FALSE,
                                   plotlyOutput("social_idic"),
                                   plotlyOutput("physical_idic"),
                                   plotlyOutput("positive_idic"),
                                   plotlyOutput("services_idic"),
                                   plotlyOutput("independence_idic"),
                                   plotlyOutput("general_idic")
                                 ),
                                 
                                 selectInput("idic_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("idic_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("idic_bar")
                                 )),
                     bs4TabPanel(tabName = 'Southeast',
                                 titlePanel('Southeast Seattle Senior Center'),
                                 selectInput("southeast_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for Southeast Seattle Senior Center',
                                   closable=FALSE,
                                   plotlyOutput("social_southeast"),
                                   plotlyOutput("physical_southeast"),
                                   plotlyOutput("positive_southeast"),
                                   plotlyOutput("services_southeast"),
                                   plotlyOutput("independence_southeast"),
                                   plotlyOutput("general_southeast")
                                 ),
                                 
                                 selectInput("southeast_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("southeast_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("southeast_bar")
                                 )),
                     bs4TabPanel(tabName = 'Sunshine Garden',
                                 titlePanel('Sunshine Garden Senior Center'),
                                 selectInput("sunshine_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for Sunshine Garden Senior Center',
                                   closable=FALSE,
                                   plotlyOutput("social_sunshine"),
                                   plotlyOutput("physical_sunshine"),
                                   plotlyOutput("positive_sunshine"),
                                   plotlyOutput("services_sunshine"),
                                   plotlyOutput("independence_sunshine"),
                                   plotlyOutput("general_sunshine")
                                 ),
                                 
                                 selectInput("sunshine_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("sunshine_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("sunshine_bar")
                                 )),
                     bs4TabPanel(tabName = 'ACRS',
                                 titlePanel('ACRS'),
                                 selectInput("acrs_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for ACRS',
                                   closable=FALSE,
                                   plotlyOutput("social_acrs"),
                                   plotlyOutput("physical_acrs"),
                                   plotlyOutput("positive_acrs"),
                                   plotlyOutput("services_acrs"),
                                   plotlyOutput("independence_acrs"),
                                   plotlyOutput("general_acrs")
                                 ),
                                 
                                 selectInput("acrs_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("acrs_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("acrs_bar")
                                 )),
                     bs4TabPanel(tabName = 'GWP',
                                 titlePanel('GWP'),
                                 selectInput("gwp_gauge", label=h3('Filter By Batch'),
                                             choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                             selected = 1),
                                 bs4Card(
                                   title = 'Index for GWP',
                                   closable=FALSE,
                                   plotlyOutput("social_gwp"),
                                   plotlyOutput("physical_gwp"),
                                   plotlyOutput("positive_gwp"),
                                   plotlyOutput("services_gwp"),
                                   plotlyOutput("independence_gwp"),
                                   plotlyOutput("general_gwp")
                                 ),
                                 
                                 selectInput("gwp_answer", label=h3('Pick a Sector to Evaluate'),
                                             choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                             selected = 1),
                                 bs4Card(
                                   title = "Over Time",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable=FALSE,
                                   plotOutput("gwp_timeplot")
                                 ),
                                 bs4Card(
                                   title = "Response for Sector",
                                   width = 12,
                                   collapsible = TRUE,
                                   closable = FALSE,
                                   plotOutput("gwp_bar")
                                 ))
                   )
        ),
        bs4TabItem('compare',
                   titlePanel("Compare Senior Centers"),
                   sidebarPanel(
                     selectInput(
                       "select3",
                       label = h3("Choose question to compare"),
                       choices = c("Do more volunteer work", "See friends more often/make new friends", "Take better care of my health", "Eat meals that are better for me", 
                                   "Have more energy", "Feel happier or more satisfied with my life", "Have something to look forward to each day", 
                                   "Know where to ask if I need service such as a ride to doctor", "Feel more able to stay independent", "Feel that the senior center has
                                   had a positive effect on my life", "Learn new things", "Have learned about services and benefits", "Am more physically active", 
                                   "Would recommend the senior center to a friend or family member", "What is your zip code", "What is your estimated annual income"),
                       selected = "Do more volunteer work"),
                     selectInput(
                       "select1",
                       label = h3("Pick first site"),
                       choices = c("ACRS", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", "Wallingford", "CISC", "South Park", "GWP", "Southeast")
                     ),
                     selectInput(
                       "select2",
                       label = h3("Pick second site"),
                       choices = c("ACRS", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", "Wallingford", "CISC", "South Park", "GWP", "Southeast"),
                       selected = "Greenwood")
                   ),
                   mainPanel(
                     plotOutput("bar")
                   )),
        bs4TabItem('general',
                   titlePanel("General Center information"),
                   mainPanel(
                     plotOutput("map")
                   )
                   )

      )
    )
  )
)