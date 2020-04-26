library(shiny)
library(ggplot2)
library(bs4Dash)
library(plotly)

answers <- c("Not applicable", "Almost Never", "Sometimes", "Most of the Time")

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <- ".mandatory_star { color: red;)"

fluidPage(
  # theme = "bootstrap.css",
  # tags$link(rel ='stylesheet', type='text/css', href='bootstrap.css'),
  shinyjs::inlineCSS(appCSS),
  tags$style(HTML("
                  div#gauge {
                    width:170px !important;
                    height:150px !important;
                  }
                  div#wallingford_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#greenwood_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#southpark_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#idic_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#southeast_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#sunshine_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#acrs_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#gwp_gauge {
                    width:170px !important;
                  height:150px !important;
                  }
                  .card-footer {
                    max-height: 200px;
                  }

                  div#social_pike {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#physical_pike {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#positive_pike {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#services_pike {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#independence_pike {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#general_pike {
                    width:170px !important;
                  height:150px !important;
                  }

                  div#social_wallingford {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#physical_wallingford {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_wallingford {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_wallingford {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_wallingford {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_wallingford {
                  width:170px !important;
                  height:150px !important;
                  }

                  div#social_greenwood {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#physical_greenwood {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_greenwood {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_greenwood {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_greenwood {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_greenwood {
                  width:170px !important;
                  height:150px !important;
                  }

                  div#social_southpark {
                    width:170px !important;
                  height:150px !important;
                  }
                  div#physical_southpark {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_southpark {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_southpark {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_southpark {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_southpark {
                  width:170px !important;
                  height:150px !important;
                  }


                  div#social_idic {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#physical_idic {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_idic {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_idic {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_idic {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_idic {
                  width:170px !important;
                  height:150px !important;
                  }

                  div#social_southeast {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#physical_southeast {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_southeast {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_southeast {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_southeast {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_southeast {
                  width:170px !important;
                  height:150px !important;
                  }

                  div#social_sunshine {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#physical_sunshine {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_sunshine {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_sunshine {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_sunshine {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_sunshine {
                  width:170px !important;
                  height:150px !important;
                  }

                  div#social_acrs {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#physical_acrs {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_acrs {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_acrs {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_acrs {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_acrs {
                  width:170px !important;
                  height:150px !important;
                  }


                  div#social_gwp {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#physical_gwp {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#positive_gwp {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#services_gwp {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#independence_gwp {
                  width:170px !important;
                  height:150px !important;
                  }
                  div#general_gwp {
                  width:170px !important;
                  height:150px !important;
                  }

                 ")),
  
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
          icon = 'info',
          bs4SidebarMenuSubItem(
            text = 'Pike',
            tabName = 'sub_pike'
          ),
          bs4SidebarMenuSubItem(
            text = 'Wallingford',
            tabName = 'sub_wallingford'
          ),
          bs4SidebarMenuSubItem(
            text = 'Greenwood',
            tabName = 'sub_greenwood'
          ),
          bs4SidebarMenuSubItem(
            text = 'South Park',
            tabName = 'sub_southpark'
          ),
          bs4SidebarMenuSubItem(
            text = 'IDIC',
            tabName = 'sub_idic'
          ),
          bs4SidebarMenuSubItem(
            text = 'Southeast',
            tabName = 'sub_southeast'
          ),
          bs4SidebarMenuSubItem(
            text = 'Sunshine Garden',
            tabName = 'sub_sunshine'
          ),
          bs4SidebarMenuSubItem(
            text = 'ACRS',
            tabName = 'sub_acrs'
          ),
          bs4SidebarMenuSubItem(
            text = 'GWP',
            tabName = 'sub_gwp'
          )
        ),
        bs4SidebarMenuItem(
          'Comparing Centers',
          tabName = 'compare',
          icon = 'sliders'
        ),
        bs4SidebarMenuItem(
          'General Info',
          tabName = 'general',
          icon = 'info'
        ),
        bs4SidebarMenuItem(
          'Survey',
          tabName = 'survey',
          icon = 'id-card'
        )
      )
    ),
    bs4DashBody(
      shinyjs::useShinyjs(),
      shinyWidgets::chooseSliderSkin("HTML5"),
      bs4TabItems(
        bs4TabItem(
          tabName = "home",
          fluidRow(
              bs4UserCard(
                width = 4,
                title = "Pike Market Senior Center",
                plotlyOutput("gauge"),
                bs4InfoBox(
                  title = 'View Data',
                  tabName = 'sub_pike',
                  gradientColor = 'primary',
                  width = 12
                )
            ),
            bs4UserCard(
              width = 4,
              title = "Wallingford Senior Center",
              status = 'primary',
              plotlyOutput('wallingford_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_wallingford',
                gradientColor = 'primary',
                width = 12
                    )
                ),
          bs4UserCard(
            title = "Greenwood Senior Center",
            width = 4,
            plotlyOutput('greenwood_gauge'),
            bs4InfoBox(
              title = 'View Data',
              tabName = 'sub_greenwood',
              gradientColor = 'primary',
              width = 12
            )
          )),
          fluidRow(
            bs4UserCard(
              title = "South Park Senior Center",
              width = 4,
              plotlyOutput('southpark_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_southpark',
                gradientColor = 'primary',
                width = 12
              )
            ),
            bs4UserCard(
              title = "International Drop-In Center",
              width = 4,
              plotlyOutput('idic_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_idic',
                gradientColor = 'primary',
                width = 12
              )
            ),
            bs4UserCard(
              title = "Southeast Seattle Senior Center",
              width = 4,
              plotlyOutput('southeast_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_southeast',
                gradientColor = 'primary',
                width = 12
              )
            )),
          fluidRow(
            bs4UserCard(
              title = "Sunshine Garden service Center",
              width = 4,
              plotlyOutput('sunshine_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_sunshine',
                gradientColor = 'primary',
                width = 12
              )
            ),
            bs4UserCard(
              title = "ACRS",
              width = 4,
              plotlyOutput('acrs_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_acrs',
                gradientColor = 'primary',
                width = 12
              )
            ),
            bs4UserCard(
              title = "GWP",
              width = 4,
              plotlyOutput('gwp_gauge'),
              bs4InfoBox(
                title = 'View Data',
                tabName = 'sub_gwp',
                gradientColor = 'primary',
                width = 12
              )
            )
          )
        ),
        bs4TabItem(tabName = 'sub_pike',
                        titlePanel('Pike Market Senior Center'),
                        br(),
                        fluidRow(
                          
                         column(
                           width = 8,
                           selectInput("pike_answer", label=h3('Pick a Sector to Evaluate'),
                                       choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                       selected = 1),
                           bs4Card(
                             title = "Over Time",
                             width = 14,
                             collapsible = TRUE,
                             closable=FALSE,
                             plotOutput("pike_timeplot")
                           ),
                           bs4Card(
                             title = "Response for Sector",
                             width = 14,
                             collapsible = TRUE,
                             closable = FALSE,
                             plotOutput("pike_bar")
                           )
                          ),
                         
                         column(
                           width= 4,
                           selectInput("pike_gauge", label=h3('Filter By Batch'),
                                       choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                       selected = 1),
                           bs4Card(
                             title = 'Index for Pike Market Senior Center',
                             closable=FALSE,
                             width=8,
                             plotlyOutput("social_pike"),
                             plotlyOutput("physical_pike"),
                             plotlyOutput("positive_pike"),
                             plotlyOutput("services_pike"),
                             plotlyOutput("independence_pike"),
                             plotlyOutput("general_pike")
                           ))
                        )
             ),
             
             bs4TabItem(tabName = 'sub_wallingford',
                         titlePanel('Wallingford Senior Center'),
                         br(),
                        fluidRow(
                          column(
                            width = 8,
                             selectInput("wallingford_answer", label=h3('Pick a Sector to Evaluate'),
                                         choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                         selected = 1),
                             bs4Card(
                               title = "Over Time",
                               width = 14,
                               collapsible = TRUE,
                               closable=FALSE,
                               plotOutput("wallingford_timeplot")
                             ),
                             bs4Card(
                               title = "Response for Sector",
                               width = 14,
                               collapsible = TRUE,
                               closable = FALSE,
                               plotOutput("wallingford_bar")
                             )),
                          column(
                            width = 4,
                            selectInput("wallingford_gauge", label=h3('Filter By Batch'),
                                        choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                        selected = 1),
                            bs4Card(
                              title = 'Index for Wallingford Senior Center',
                              closable=FALSE,
                              width = 8,
                              plotlyOutput("social_wallingford"),
                              plotlyOutput("physical_wallingford"),
                              plotlyOutput("positive_wallingford"),
                              plotlyOutput("services_wallingford"),
                              plotlyOutput("independence_wallingford"),
                              plotlyOutput("general_wallingford")
                            )
                          )
                        )),
             bs4TabItem(tabName = 'sub_greenwood',
                         titlePanel('Greenwood Senior Center'),
                        fluidRow(
                          column(
                            width = 8,
                             selectInput("greenwood_answer", label=h3('Pick a Sector to Evaluate'),
                                         choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                         selected = 1),
                             bs4Card(
                               title = "Over Time",
                               width = 14,
                               collapsible = TRUE,
                               closable=FALSE,
                               plotOutput("greenwood_timeplot")
                             ),
                             bs4Card(
                               title = "Response for Sector",
                               width = 14,
                               collapsible = TRUE,
                               closable = FALSE,
                               plotOutput("greenwood_bar")
                             )),
                          column(
                            width = 4,
                            selectInput("greenwood_gauge", label=h3('Filter By Batch'),
                                        choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                        selected = 1),
                            bs4Card(
                              title = 'Index for Greenwood Senior Center',
                              closable=FALSE,
                              width= 8,
                              plotlyOutput("social_greenwood"),
                              plotlyOutput("physical_greenwood"),
                              plotlyOutput("positive_greenwood"),
                              plotlyOutput("services_greenwood"),
                              plotlyOutput("independence_greendwood"),
                              plotlyOutput("general_greenwood")
                            )
                          )
                        )
             ),
             bs4TabItem(tabName = 'sub_southpark',
                         titlePanel('South Park Senior Center'),
                         fluidRow(
                           column(
                              width = 8,
                             selectInput("southpark_answer", label=h3('Pick a Sector to Evaluate'),
                                         choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                         selected = 1),
                             bs4Card(
                               title = "Over Time",
                               width = 14,
                               collapsible = TRUE,
                               closable=FALSE,
                               plotOutput("southpark_timeplot")
                             ),
                             bs4Card(
                               title = "Response for Sector",
                               width = 14,
                               collapsible = TRUE,
                               closable = FALSE,
                               plotOutput("southpark_bar")
                             )),
                           column(
                             width = 4,
                             selectInput("southpark_gauge", label=h3('Filter By Batch'),
                                         choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                         selected = 1),
                             bs4Card(
                               title = 'Index for South Park Senior Center',
                               width = 8,
                               closable=FALSE,
                               plotlyOutput("social_southpark"),
                               plotlyOutput("physical_southpark"),
                               plotlyOutput("positive_southpark"),
                               plotlyOutput("services_southpark"),
                               plotlyOutput("independence_southpark"),
                               plotlyOutput("general_southpark")
                             )
                           )
                         )
             ),
             bs4TabItem(tabName = 'sub_idic',
                         titlePanel('International Drop-In Center'),
                         fluidRow(
                            column(
                              width = 8,
                             selectInput("idic_answer", label=h3('Pick a Sector to Evaluate'),
                                         choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                         selected = 1),
                             bs4Card(
                               title = "Over Time",
                               width = 14,
                               collapsible = TRUE,
                               closable=FALSE,
                               plotOutput("idic_timeplot")
                             ),
                             bs4Card(
                               title = "Response for Sector",
                               width = 14,
                               collapsible = TRUE,
                               closable = FALSE,
                               plotOutput("idic_bar")
                             )),
                            column(
                              width = 4,
                              selectInput("idic_gauge", label=h3('Filter By Batch'),
                                          choices = list('2017' = 1, '2018' = 2, '2019' = 3),
                                          selected = 1),
                              bs4Card(
                                title = 'Index for International Drop-In Center',
                                closable=FALSE,
                                width = 8,
                                plotlyOutput("social_idic"),
                                plotlyOutput("physical_idic"),
                                plotlyOutput("positive_idic"),
                                plotlyOutput("services_idic"),
                                plotlyOutput("independence_idic"),
                                plotlyOutput("general_idic")
                              )
                            )
                         )
             ),
             bs4TabItem(tabName = 'sub_southeast',
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
             bs4TabItem(tabName = 'sub_sunshine',
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
             bs4TabItem(tabName = 'sub_acrs',
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
             bs4TabItem(tabName = 'sub_gwp',
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
                         )),

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
        ),
        bs4TabItem('survey',
                   titlePanel("Senior Center Survey Form"),
                   shinyjs::useShinyjs(),
                   div(
                     id = "form",
                     selectInput(
                       "which_center",
                       label = h5(labelMandatory("What senior center do you currently reside in?")),
                       choices = c("ACRS", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", "Wallingford", "CISC", "South Park", "GWP", "Southeast"),
                       selected = "Greenwood"
                      ),
                     textInput("zipcode", labelMandatory("What is your zipcode"), ""),
                     bs4Card(
                       title = "I do more volunteer work at my Senior Center",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("do_more_volunteer_work", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                      title = "I see friends more often/make new friends at my Senior Center",
                      width = 14,
                      collapsible = FALSE,
                      closable=FALSE,
                      radioButtons("see_friends", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I take better care of my health at my Senior Center",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("better_health", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I eat meals that are better for me at my Senior Center",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("better_meals", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I have more energy",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("more_energy", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I feel happier or more satisfied with my life",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("happier_life", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I know where to ask if I need service such as a ride to doctor",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("ask_services", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I feel more able to stay independent",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("more_independent", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I feel that the senior center has had a positive effect on my life",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("positive_effect", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I learn new things at my senior center",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("learn_new_things", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I have learned about services and benefits at my senior center",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("learn_new_services", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I am more physically active",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("physically_active", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     bs4Card(
                       title = "I would recommend my senior center to a friend or family member",
                       width = 14,
                       collapsible = FALSE,
                       closable=FALSE,
                       radioButtons("would_recommend", label="", choices = answers, inline=TRUE, selected = character(0))
                     ),
                     # textInput("free_response", "Please tell us how participating in the senior center has changed your life"),
                     
                     # Submit button to upload responses
                     actionButton("submit", "Submit")
                   ),
                 shinyjs::hidden(
                   div(
                     id = "thankyou_msg",
                     h3("Thanks, your response was submitted successfully!"),
                     actionLink("submit_another", "Submit another response")
                   )
                 )  
        )
      )
    )
  )
)