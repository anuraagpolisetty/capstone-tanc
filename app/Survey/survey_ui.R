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
        selected = character(0) #centers[1]
      ),
      numericInput("Zipcode", labelMandatory("What is your zipcode"), ""),
      h3("Because I go to the senior center, I ..."),
      lapply(1:length(questions), function(i) {
        bs4Card(
          title = h4(labelMandatory(all_questions[i])),
          width = 14,
          collapsible = FALSE,
          closable=FALSE,
          radioButtons(all_questions[i], label="", choices = answers, inline=FALSE, selected = character(0))
        )
      }),
      bs4Card(
        title = h4(labelMandatory("Please tell us how participating in the senior center has changed your life")),
        width = 14,
        collapsible = FALSE,
        closable=FALSE,
        textInput("Please tell us how participating in the senior center has changed your life", label="")
      ),
      bs4Card(
        title = h4(labelMandatory("I participate in the following activities at the senior Center")),
        width = 14,
        collapsible = FALSE,
        closable=FALSE,
        textInput("I participate in the following activities at the senior Center", label="")
      ),
  
      # bs4Card(
      #   title = h3(labelMandatory("Please tell us how participating in the senior center has changed your life")),
      #   width = 14,
      #   collapsible = FALSE,
      #   closable=FALSE,
      #   # textAreaInput("free_response1",
      #   #               NULL,
      #   #               "summary",
      #   #               # placeholder = "Type your answer in here...",
      #   #               # resize = "both",
      #   #               width = validateCssUnit(800)
      #   #               ),
      # ),
      # textAreaInput("free_response2",
      #               span("I participate in the following activities at the senior Center"),
      #               placeholder = "Type your activities in here...",
      #               resize = "both",
      #               width = validateCssUnit(800)
      #               ),
      bs4Card(
        title = labelMandatory("How would you describe your race/ethnicity"),
        width = 14,
        collapsible = FALSE,
        closable=FALSE,
        radioButtons("Race/Ethnicity", label="", choices = race_ethnicity, inline=FALSE, selected = character(0))
      ),
      bs4Card(
        title = labelMandatory("What is your estimated annual income"),
        width = 14,
        collapsible = FALSE,
        closable=FALSE,
        radioButtons("What is your estimated annual income", label="", choices = income_brackets, inline=FALSE, selected = character(0))
      ),
      # Submit button to upload responses
      actionButton("submit", "Submit"),
      div(
        id="submit_msg",
        span("Please make sure every question has been answered", id="submit_message",class = "mandatory_star")
      )
  ),
  shinyjs::hidden(
    div(
      id = "thankyou_msg",
      h3("Thanks, your response was submitted successfully!"),
      actionLink("submit_another", "Submit another response")
    )
  )
  
)
