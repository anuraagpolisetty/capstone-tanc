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
    list(bs4TabItem('survey',
                    titlePanel("Senior Center Survey Form"),
                    shinyjs::useShinyjs(),
                    shinyjs::inlineCSS(appCSS),
                    div(
                      id = "form",
                      selectInput(
                        "which_center",
                        label = h5(labelMandatory("What senior center do you currently reside in?")),
                        choices = centers,
                        selected = centers[1]
                      ),
                      textInput("zipcode", labelMandatory("What is your zipcode"), ""),
                      bs4Card(
                        title = "I do more volunteer work at my Senior Center",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("do_more_volunteer_work", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I see friends more often/make new friends at my Senior Center",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("see_friends", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I take better care of my health at my Senior Center",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("better_health", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I eat meals that are better for me at my Senior Center",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("better_meals", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I have more energy",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("more_energy", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I feel happier or more satisfied with my life",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("happier_life", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I know where to ask if I need service such as a ride to doctor",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("ask_services", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I feel more able to stay independent",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("more_independent", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I feel that the senior center has had a positive effect on my life",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("positive_effect", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I learn new things at my senior center",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("learn_new_things", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I have learned about services and benefits at my senior center",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("learn_new_services", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = "I am more physically active",
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("physically_active", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      bs4Card(
                        title = labelMandatory("I would recommend my senior center to a friend or family member"),
                        width = 14,
                        collapsible = FALSE,
                        closable=FALSE,
                        radioButtons("would_recommend", label="", choices = answers, inline=FALSE, selected = character(0))
                      ),
                      # textInput("free_response", "Please tell us how participating in the senior center has changed your life"),
                      
                      # Submit button to upload responses
                      actionButton("submit", "Submit"),
                      source(file = "Survey/survey_ui.R", local=T)[1]
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
  do.call(tabItems, items)
})