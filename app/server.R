# Server used to host the application. 
# Creates the plots displayed to the user and considers user input. 

library(plotly)
library(shiny)
library(ggplot2)
library(ISOcodes)
library(bs4Dash)
library(rsconnect)
source('scripts/Tabitha_Analysis.R')
source('scripts/GaugeChart.R')
source('Map/MapPlot.R')

appCSS <- ".mandatory_star { color: red;)"

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

grouped.data <- data %>% group_by(SiteID) %>% summarise(count=n())
batches.inputted <- data %>% group_by(Batch) %>% summarise(count=n())

function(input, output, session) {
  # source('Single_Center/pike_server.R', local = T)
  # source('Single_Center/wallingford_server.R', local = T)
  # source('Single_Center/greenwood_server.R', local = T)
  # source('Single_Center/southpark_server.R', local = T)
  # source('Single_Center/idic_server.R', local = T)
  # source('Single_Center/southeast_server.R', local = T)
  # source('Single_Center/sunshine_server.R', local = T)
  # source('Single_Center/acrs_server.R', local = T)
  # source('Single_Center/gwp_server.R', local=T)
  # source('Single_Center/west_server.R', local=T)
  # source('Single_Center/ballard_server.R', local=T)
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
                     bs4Card(inputId = 'Indices',
                       title = paste('Index for ', centers[k], ' Senior Center'),
                       closable=FALSE,
                       width=10,
                       plotlyOutput(paste0("Social_", centers[k])),
                       plotlyOutput(paste0("Physical_", centers[k])),
                       plotlyOutput(paste0("Positivity_", centers[k])),
                       plotlyOutput(paste0("Services_", centers[k])),
                       plotlyOutput(paste0("Independence_", centers[k])),
                       plotlyOutput(paste0("Overall_", centers[k]))
                     )
                   )
                 )
      )
    })
    
    items <- c(
      list(
        bs4TabItem(
          tabName = "home",
          class = 'active',
          bs4Card(width=12, title='Description Here...',
                  closable=FALSE),
          lapply(1:length(centers), function(i){
            fluidRow(
              bs4Card(
                width = 12,
                title = paste(centers[i], "Senior Center"),
                headerBorder = FALSE,
                closable = FALSE,
                collapsible = FALSE,
                attachmentBlock(
                  src=images[i]
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
                                    value=nrow(data),
                                    subtitle ='Total Responses',
                                    footer=NULL,
                                    href=NULL,
                                    elevation=NULL,
                                    status='primary'),
                        bs4ValueBox(width=4,
                                    value=nrow(grouped.data),
                                    subtitle ='Total Senior Centers',
                                    footer=NULL,
                                    href=NULL,
                                    elevation=NULL,
                                    status='primary'),
                        bs4ValueBox(width=4,
                                    value=nrow(batches.inputted),
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
                        actionButton("submit", "Submit"),
                        span("Please make sure every question has been answered", class = "mandatory_star")
                        
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
  
  
  lapply(1:length(centers), function(i) {
    cleaned_data <- cleaned_data %>% filter(SiteID == centers[i])
    
    output[[(paste0(centers[i], '_gauge'))]] <- renderPlotly({
      cleaned.data.2019 <- data.2019 %>% filter(SiteID == centers[i])
      GaugeChart(cleaned_data, OverallIndex, "all", "2021", 'rgb(255,255,255)', 'Overall Index')
    })
    lapply(1:length(sectors), function(j) {
      sector.center <- paste0(sectors[j], '_', centers[i])
      selected.batch <- paste0(centers[i], '_gauge')
      output[[sector.center]] <- renderPlotly({
        filtered.by.batch <- cleaned_data %>% filter(Batch == input[[selected.batch]])
        date <- substr(selected.batch, 1, 4)
        GaugeChart(filtered.by.batch, get(index[j]), 'all', date, 'rgb(255, 255, 255)', sectors[j])
      })
    })
    
    output[[(paste0(centers[i], '_timeplot'))]] <- renderPlotly({
      if(input[[paste0(centers[i], "_answer")]] == sectors[1]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Do.more.volunteer.work), mean2 = mean(See.friends.more.often.make.new.friends))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      else if(input[[paste0(centers[i], "_answer")]] == sectors[2]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Take.better.care.of.my.health), mean2 = mean(Eat.meals.that.are.better.for.me), mean3 = mean(Have.more.energy), mean4 = mean(Am.more.physically.active))
        social.life.means <-  time.data %>% select(mean1, mean2, mean3, mean4) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      else if(input[[paste0(centers[i], "_answer")]] == sectors[3]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Feel.happier.or.more.satisfied.with.my.life), mean2 = mean(Have.something.to.look.forward.to.each.day))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      else if(input[[paste0(centers[i], "_answer")]] == sectors[4]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide), mean2 = mean(Have.learned.about.services.and.benefits))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      
      else if(input[[paste0(centers[i], "_answer")]] == sectors[5]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(total_mean = mean(Feel.more.able.to.stay.independent))
      }
      
      else if(input[[paste0(centers[i], "_answer")]] == sectors[6]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Would.recommend.the.senior.center.to.a.friend.or.family.member), mean2 = mean(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      time.data <- time.data %>% mutate(Mean = round(total_mean, digits=2))
      ggplot(time.data, aes(x=Batch, y=Mean, group = 1)) + geom_point(color='#0275d8') + geom_line(color='#0275d8') + ylim(1,3) + ylab('Mean Index')
    })
    output[[(paste0(centers[i], '_bar'))]] <- renderPlotly({
      if(input[[paste0(centers[i], '_answer')]]== sectors[1]) {
        sum1 <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(See.friends.more.often.make.new.friends) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      else if(input[[paste0(centers[i], '_answer')]] == sectors[2]) {
        sum1 <- bar_data %>% group_by(Take.better.care.of.my.health) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Eat.meals.that.are.better.for.me) %>% summarise(count2 = n())
        sum3 <- bar_data %>% group_by(Have.more.energy) %>% summarise(count3 = n())
        sum4 <- bar_data %>% group_by(Am.more.physically.active) %>% summarise(count4 = n())
        sum1$total_count <- sum1$count1 + sum2$count2 + sum3$count3 + sum4$count4
        names(sum1)[1] <- 'categories'
      }
      else if(input[[paste0(centers[i], '_answer')]] == sectors[3]) {
        sum1 <- bar_data %>% group_by(Feel.happier.or.more.satisfied.with.my.life) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Have.something.to.look.forward.to.each.day) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      else if(input[[paste0(centers[i], '_answer')]] == sectors[4]) {
        sum1 <- bar_data %>% group_by(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Have.learned.about.services.and.benefits) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      
      else if(input[[paste0(centers[i], '_answer')]] == sectors[5]) {
        sum1 <- bar_data %>% group_by(Feel.more.able.to.stay.independent) %>% summarise(total_count = n())
        names(sum1)[1] <- 'categories'
      }
      
      else if(input[[paste0(centers[i], '_answer')]] == sectors[6]) {
        sum1 <- bar_data %>% group_by(Would.recommend.the.senior.center.to.a.friend.or.family.member) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      sum1 <- sum1 %>% drop_na() %>% mutate(Categories = fct_reorder(categories, -total_count), Count = total_count)
      ggplot(sum1, aes(x=Categories,y=Count))+geom_bar(stat="identity", color = '#0275d8', fill='#0275d8')+ xlab('Survey Responses') + ylab('Count')
    })
  })
  # })
  
  source('Compare/compare_server.R', local=T)
  
  source('Survey/Survey.R', local = T)
  output$map <- renderPlotly({
    ggplotly(p, tooltip = 'text')
  })
  
  
}