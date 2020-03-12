library(shiny)
library(dplyr)
library(ggplot2)
data <- read.csv("./TOTAL.csv")
test <- unique(data$SiteID)
filtered <- filter(data, SiteID == "GWP")
View(filtered)
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Survey Questions"),

    # Sidebar with a slider input for number of bins 
        sidebarPanel(
            radioButtons("question",
                        "Select Question",
                        choices = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"),
                        selected = "1"),
            selectInput(
                "select",
                label = h3("Filter on site"),
                choices = c("All", "ACRS", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", "Wallingford", "CISC", "South Park", "GWP", "Southeast")
            )
            ),
        mainPanel(
           plotOutput("bar"),
           plotOutput("income")
        )
    )

server <- function(input, output) {
    output$bar <- renderPlot({
        if (input$question == "1") {
            tbl <- with(data, table(data$Do.more.volunteer.work))
        }
        else if (input$question == "2") {
            tbl <- with(data, table(data$See.friends.more.often.make.new.friends))
        }
        else if (input$question == "3") {
            tbl <- with(data, table(data$Take.better.care.of.my.health))
        }
        else if (input$question == "4") {
            tbl <- with(data, table(data$Eat.meals.that.are.better.for.me))
        }
        else if (input$question == "5") {
            tbl <- with(data, table(data$Have.more.energy))
        }
        else if (input$question == "6") {
            tbl <- with(data, table(data$Feel.happier.or.more.satisfied.with.my.life))
        }
        else if (input$question == "7") {
            tbl <- with(data, table(data$Have.something.to.look.forward.to.each.day))
        }
        else if (input$question == "8") {
            tbl <- with(data, table(data$Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide))
        }
        else if (input$question == "9") {
            tbl <- with(data, table(data$Feel.more.able.to.stay.independent))
        }
        else if (input$question == "10") {
            tbl <- with(data, table(data$Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life))
        }
        else if (input$question == "11") {
            tbl <- with(data, table(data$Learn.new.things))
        }
        else if (input$question == "12") {
            tbl <- with(data, table(data$Have.learned.about.services.and.benefits))
        }
        else if (input$question == "13") {
            tbl <- with(data, table(data$Am.more.physically.active))
        }
        else if (input$question == "14") {
            tbl <- with(data, table(data$Would.recommend.the.senior.center.to.a.friend.or.family.member))
        }
        
        barplot(tbl, beside = TRUE, legend = TRUE)
    })
    output$income <- renderPlot({
        if (input$select == "ACRS") {
            filtered <- filter(data, SiteID == "ACRS")
        }
        else if (input$select == "Greenwood") {
            filtered <- filter(data, SiteID == "Greenwood")
        }
        else if (input$select == "IDIC") {
            filtered <- filter(data, SiteID == "IDIC")
        }
        else if (input$select == "PMSC") {
            filtered <- filter(data, SiteID == "PMSC")
        }
        else if (input$select == "Sunshine Garden") {
            filtered <- filter(data, SiteID == "Sunshine Garden")
        }
        else if (input$select == "Wallingford") {
            filtered <- filter(data, SiteID == "Wallingford")
        }
        else if (input$select == "CISC") {
            filtered <- filter(data, SiteID == "CISC")
        }
        else if (input$select == "South Park") {
            filtered <- filter(data, SiteID == "South Park")
        }
        else if (input$select == "GWP") {
            filtered <- filter(data, SiteID == "GWP")
        }
        else if (input$select == "Southeast") {
            filtered <- filter(data, SiteID == "Southeast")
        }
        else {
            filtered <- data
        }
        filtered <- filter(filtered, !is.na(filtered$What.is.your.estimated.annual.income))
        ggplot(filtered, aes(filtered$What.is.your.estimated.annual.income), y = count()) + geom_bar() +
            coord_flip()
    })
        
}

# Run the application 
shinyApp(ui = ui, server = server)
