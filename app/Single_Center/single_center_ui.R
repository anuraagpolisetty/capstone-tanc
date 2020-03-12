single_center_tab -> bs4TabItem(
                    tabName = 'pike',
                    titlePanel('Pike Market Senior Center'),
                    bs4Card(
                      title = 'Index for Pike Market Senior Center',
                      closable=FALSE,
                      plotlyOutput("social"),
                      plotlyOutput("physical"),
                      plotlyOutput("positive"),
                      plotlyOutput("services"),
                      plotlyOutput("independence"),
                      plotlyOutput("general")
                    ),
                  
                      selectInput("answer", label=h3('Pick a Sector to Evaluate'),
                                  choices = list('Social Life' = 1, 'Physical Health' = 2, 'Positive Outlook' = 3, ' Access to Services' = 4, 'Independence' = 5, 'Overall Satisfaction' = 6),
                                  selected = 1),
                      bs4Card(
                        title = "Over Time",
                        width = 12,
                        collapsible = TRUE,
                        closable=TRUE,
                        plotOutput("timeplot")
                      ),
                      bs4Card(
                        title = "Response for Sector",
                        width = 12,
                        collapsible = TRUE,
                        closable = TRUE,
                        plotOutput("single_center_bar")
                      )
                    )