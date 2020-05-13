list(

"survey",
titlePanel("Senior Center Survey Form"),
shinyjs::useShinyjs(),
shinyjs::inlineCSS(appCSS),
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
  textInput("free_response", "Please tell us how participating in the senior center has changed your life")
  )
)