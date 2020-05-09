library(shiny)
source('Survey/Sheets.r')

# 
fieldsMandatory <- c("which_center","zipcode",
                     # "do_more_volunteer_work", "see_friends", "physically_active", 
                     "would_recommend")
fieldsAll <- c("which_center","zipcode", "do_more_volunteer_work", "see_friends", "better_health",
               "better_meals", "more_energy", "happier_life", "ask_services", "more_independent", 
               "positive_effect", "learn_new_things", "learn_new_services","physically_active", 
               "would_recommend", "free_response")
responsesDir <- file.path("Survey/responses")
epochTime <- function() {
  as.integer(Sys.time())
}

humanTime <- function() {
  format(Sys.time(), "%Y%m%d-%H%M%OS")
}

v <- reactiveValues(data = character(0))

observe({
  mandatoryFilled <-
    vapply(fieldsMandatory, 
           function(x) {
             !is.null(input[[x]]) && input[[x]] != ""
           },
           logical(1))
  mandatoryFilled <- all(mandatoryFilled)
  
  # enable/disable the submit button
  shinyjs::toggleState(id = "submit", condition = mandatoryFilled)
  shinyjs::toggleClass(id = "submit", condition = mandatoryFilled, class = "btn-primary")
})

# #Downloads the file as a csv
# saveData <- function(data) {
#   fileName <- sprintf("%s_%s.csv",
#                       humanTime(),
#                       digest::digest(data))
#   
#   write.csv(x = data, file = file.path(responsesDir, fileName),
#             row.names = FALSE, quote = TRUE)
# }


# Saves and formats the submit data
formData <- reactive({
  data <- sapply(fieldsAll, function(x) input[[x]])
  data <- c(data, timestamp = epochTime())
  data <- t(data)
  data
})

# action to take when submit button is pressed
observeEvent(input$submit, {
  saveData(formData()) # saves the data in function in Sheets.R
  shinyjs::reset("form")
  shinyjs::hide("form")
  shinyjs::show("thankyou_msg")
})

# rerenders the form 
observeEvent(input$submit_another, {
  shinyjs::show("form")
  shinyjs::hide("thankyou_msg")
}) 