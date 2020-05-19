library(shiny)
library(bs4Dash)
source('Survey/Sheets.R')

# Reads and saves all the survey answers and sends to Sheets.R to upload to Google Sheets


survey.fields <- all_questions
response.fields <- c("Please tell us how participating in the senior center has changed your life",
                     "I participate in the following activities at the senior Center")
id.fields <- c("Race/Ethnicity", "Zipcode", "What is your estimated annual income")

fieldsMandatory <- c(survey.fields, response.fields, id.fields) 

all.columns <- c("Batch", "SiteID", "Date", fieldsMandatory)

responsesDir <- file.path("Survey/responses")
epochTime <- function() {
  as.integer(Sys.time())
}

humanTime <- function() {
  format(Sys.time(), "%Y-%m-%d %H:%M:%OS")
}

# Calculate the batch column based on month of survey taken
# ex. If taken in January - June, batch is 1 (ex. "2020-1")
calc_batch <- function(time) {
  year <- substr(time, 1, 4)
  month <- as.numeric(substr(time, 6, 7))
  batch <- if(month <= 6) paste0(year, "-1") else paste0(year, "-2")
  batch
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
  shinyjs::toggle(id="submit_msg", condition = !mandatoryFilled)
})


# Saves and formats the submit data
formData <- reactive({
  data <- sapply(fieldsMandatory, function(x) input[[x]])
  siteID <- data[1]
  # Columns match with Batch #, SitID, TimeStamp, and the rest of the questions
  data <- c(calc_batch(humanTime()), siteID, humanTime(), data[-1])
  data <- t(data)
  data
})

# action to take when submit button is pressed
observeEvent(input$submit, {
  saveData(formData(), columns = all.columns) # saves the data in function in Sheets.R
  shinyjs::reset("form")
  shinyjs::hide("form")
  shinyjs::show("thankyou_msg")
})

# rerenders the form 
observeEvent(input$submit_another, {
  shinyjs::show("form")
  shinyjs::hide("thankyou_msg")
}) 
