# labelMandatory <- function(label) {
#   tagList(
#     label,
#     span("*", class = "mandatory_star")
#   )
# }

list(
  titlePanel("Senior Center Survey Form"),
  shinyjs::useShinyjs(),
  shinyjs::inlineCSS(appCSS),
  div(
      id = "form",
      h5("Think about your life since you started since you started attending the senior center. Below
         are some ways that senior centers might make a difference. Please select the choice that best
         matches your response for each statement."),
      selectInput(
        "SiteID",
        label = h6(labelMandatory("Which senior center do you currently attend?")),
        choices = centers, #centers,
        selected = centers[1] #centers[1]
      ),
      textInput("zipcode", labelMandatory("What is your zipcode"), ""),
      h3("Because I go to the senior center, I ..."),
      lapply(1:length(questions), function(i) {
        bs4Card(
          title = labelMandatory(all_questions[i]),
          width = 14,
          collapsible = FALSE,
          closable=FALSE,
          radioButtons(all_questions[i], label="", choices = answers, inline=FALSE, selected = character(0))
        )
      }),
      
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
