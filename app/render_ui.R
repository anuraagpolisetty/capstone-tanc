appCSS <- ".mandatory_star { color: red;)"

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

output$SingleCenters <- renderUI({
  subCenters <- lapply(1:length(centers), function(k) {
    bs4TabItem(tabName = paste0('sub_', centers[k]),
               titlePanel(centers[k]),
               br(),
                fluidRow(
                   column(
                     width = 8,
                     selectInput(paste0(centers[k], '_answer'),
                                 label = h3('Pick a Sector to Evaluate'),
                                 choices = sectors),
          
                    bs4Card(
                      title = "Mean Index Over Time",
                      width = 14,
                      collapsible = TRUE,
                      closable = FALSE,
                      plotlyOutput(paste0(centers[k], '_timeplot'))
                    ),
                    bs4Card(
                      title = "Response For Sector",
                      width = 14,
                      collapsible=TRUE,
                      closable=FALSE,
                      plotlyOutput(paste0(centers[k], '_bar'))
                    )
                ),
                 column(
                   width= 4,
                   selectInput(paste0(centers[k],"_gauge"), label=h3('Filter By Batch'),
                               choices = batches,
                               selected = batches[k]),
                   bs4Card(
                     title = paste('Index for ', centers[k], ' Senior Center'),
                     closable=FALSE,
                     width=10,
                     plotlyOutput(paste0("social_", centers[k])),
                     plotlyOutput(paste0("physical_", centers[k])),
                     plotlyOutput(paste0("positive_", centers[k])),
                     plotlyOutput(paste0("services_", centers[k])),
                     plotlyOutput(paste0("independence_", centers[k])),
                     plotlyOutput(paste0("general_", centers[k]))
                   )
                )
            )
    )
  })
  
  items <- c(
    list(
      bs4TabItem(
        tabName = "home",
        lapply(1:length(centers), function(i){
          fluidRow(
            bs4Card(
              width = 12,
              title = paste(centers[i], "Senior Center"),
              headerBorder = FALSE,
              closable = FALSE,
              collapsible = FALSE,
              attachmentBlock(
                src='pike.jpg'
              ),
              bs4InfoBox(title='View Data',
                         tabName = paste0('sub_', centers[i]),
                         gradientColor = 'primary',
                         width=3,
                         icon='chart-bar'),
              plotlyOutput(paste0(centers[i], "_gauge"))
            )
          )
        })
      )
    ),
    subCenters,
    list(    
      bs4TabItem('compare',
                 source('Compare/compare_ui.R')
      )),
    list(bs4TabItem('general',
                    titlePanel("General Center information"),
                    fluidRow(
                      bs4ValueBox(width=4,
                                  value=4405,
                                  subtitle ='Total Responses',
                                  footer=NULL,
                                  href=NULL,
                                  elevation=NULL,
                                  status='primary'),
                      bs4ValueBox(width=4,
                                  value=11,
                                  subtitle ='Total Senior Centers',
                                  footer=NULL,
                                  href=NULL,
                                  elevation=NULL,
                                  status='primary'),
                      bs4ValueBox(width=4,
                                  value=6,
                                  subtitle ='Batches Inputted',
                                  footer=NULL,
                                  href=NULL,
                                  elevation=NULL,
                                  status='primary')
                    ),
                    mainPanel(
                      width = 12,
                      plotlyOutput("map")
                    )
    )),
    list(bs4TabItem(
            tabName = 'survey',
            source(file = "Survey/survey_ui.R", local=T)[1]
          )
    )
  )
  
  do.call(tabItems, items)
})