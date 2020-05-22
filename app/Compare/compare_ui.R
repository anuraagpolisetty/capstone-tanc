source('./constants.R')
list(
  titlePanel("Compare Senior Centers"),
  fluidRow(
    column(
      width = 4,
      bs4Box(
        width = 12,
        selectInput(
          "select3",
          label = h3("Choose question to compare"),
          choices = all_questions,
          selected = all_questions[1]),
        selectInput(
          "select1",
          label = h3("Pick first site"),
          choices = centers,
          selected = centers[1]
        ),
        selectInput(
          "select2",
          label = h3("Pick second site"),
          choices = centers,
          selected = centers[2])
      )),
    column(
      width = 8,
      plotlyOutput("bar")  %>% 
        withSpinner(type = 3, color="lightgreen", color.background = "rgb(245,245,245)")
    )
  )
)