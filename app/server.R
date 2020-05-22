# Server used to host the application. 
# Creates the plots displayed to the user and considers user input. 

library(plotly)
library(shiny)
library(ggplot2)
library(ISOcodes)
library(bs4Dash)
library(rsconnect)
library(shinyalert)
library(shinycssloaders)
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

  output$SingleCenters <- renderUI({
    subCenters <- lapply(1:length(centers), function(k) {
      bs4TabItem(tabName = paste0('sub_', gsub(' ', '', centers[k])),
                 fluidRow(
                   column(
                     width = 8,
                     bs4Card(title = h1(centers[k]), collapsible = FALSE, closable=FALSE, width = 12,
                             selectInput(paste0(gsub(' ', '', centers[k]), '_answer'),
                                         label = h3('Pick a Sector to Evaluate'),
                                         choices = sectors)),
                     
                     bs4Card(
                       title = "Mean Index Over Time",
                       width = 14,
                       collapsible = TRUE,
                       closable = FALSE,
                       plotlyOutput(paste0(gsub(' ', '', centers[k]), '_timeplot'))
                     ),
                     bs4Card(
                       title = "Response For Sector",
                       width = 14,
                       collapsible=TRUE,
                       closable=FALSE,
                       plotlyOutput(paste0(gsub(' ', '', centers[k]), '_bar'))
                     )
                   ),
                   column(
                     width= 4,
                     bs4Card(inputId = 'Indices',
                             title = 
                               selectInput(label = paste("Average Index"),paste0(gsub(' ', '', centers[k]),"_gauge"),
                                           #choices = batches[k]),
                                           choices = cleaned_data %>% filter(SiteID == centers[k]) %>% group_by(Batch) %>% summarise(count = n()) %>% pull(Batch)), 
                             closable=FALSE,
                             collapsible = FALSE,
                             width=10,
                             plotlyOutput(paste0("Social_", gsub(' ', '', centers[k]))),
                             plotlyOutput(paste0("Social_", gsub(' ', '', centers[k]))),
                             plotlyOutput(paste0("Physical_", gsub(' ', '', centers[k]))),
                             plotlyOutput(paste0("Positivity_", gsub(' ', '', centers[k]))),
                             plotlyOutput(paste0("Services_", gsub(' ', '', centers[k]))),
                             plotlyOutput(paste0("Independence_", gsub(' ', '', centers[k]))),
                             plotlyOutput(paste0("Overall_", gsub(' ', '', centers[k])))
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
          bs4Card(id = 'Intro', width=12, title=h1('Welcome to the ADS Dashboard'),
                  "This webpage is the central hub of data storage for the City of Seattle's Aging and Disability Services. 
                  Navigate through the site to take surveys, analyze data, and see visualizations of responses.
                  Click on any senior center and View Data in order to see more insights and analysis regarding health, wellness,
                  and many other impact measures. These impact measures are indexed on a scale of 1-3, with 3 being the highest and 1 being the lowest. 
                  If you would like to take a survey about any of these centers, please navigate to the Survey tab and tell us your thoughts!",
                  collapsible=FALSE, 
                  closable=FALSE),
          lapply(1:length(centers), function(i){
            fluidRow(
              bs4Card(
                width = 12,
                height = 200,
                title = h3(paste(centers[i])),
                headerBorder = FALSE,
                closable = FALSE,
                collapsible = FALSE,
                column(
                  width = 10,
                  plotlyOutput(paste0(gsub(' ', '', centers[i]), "_gauge")) 
                            %>% withSpinner(type = 3, color="lightgreen", color.background = "#fff"),
                ),
                bs4InfoBox(title='View Data',
                           tabName = paste0('sub_', gsub(' ', '', centers[i])),
                           gradientColor = 'primary',
                           width=2,
                           icon='chart-bar')
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
                      br(),
                      mainPanel(
                        width = 12,
                        plotlyOutput("race"),
                        br(),
                        plotlyOutput("map")
                      )
      )),
      list(bs4TabItem('survey',
                      source("Survey/survey_ui.R", local=T)[1])
      )
      
    )
    do.call(tabItems, items)
  })

  lapply(1:length(centers), function(i) {
    cleaned_data <- cleaned_data %>% filter(SiteID == centers[i])
    
    output[[(paste0(gsub(' ', '', centers[i]), '_gauge'))]] <- renderPlotly({
      cleaned.data.2019 <- data.2019 %>% filter(SiteID == centers[i])
      GaugeChart(cleaned_data, OverallIndex, "all", "2019-2", 'rgb(255,255,255)', 'Overall Index', centers[i])
    })
    lapply(1:length(sectors), function(j) {
      sector.center <- paste0(sectors[j], '_', gsub(' ', '', centers[i]))
      selected.batch <- paste0(gsub(' ', '', centers[i]), '_gauge')
      output[[sector.center]] <- renderPlotly({
        filtered.by.batch <- cleaned_data %>% filter(Batch == input[[selected.batch]])
        GaugeChart(filtered.by.batch, get(index[j]), 'all', input[[selected.batch]], 'rgb(255, 255, 255)', sectors[j], centers[i])
      })
    })
    
    output[[(paste0(gsub(' ', '', centers[i]), '_timeplot'))]] <- renderPlotly({
      if(input[[paste0(gsub(' ', '', centers[i]), "_answer")]] == sectors[1]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Do.more.volunteer.work), mean2 = mean(See.friends.more.often.make.new.friends))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      else if(input[[paste0(gsub(' ', '', centers[i]), "_answer")]] == sectors[2]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Take.better.care.of.my.health), mean2 = mean(Eat.meals.that.are.better.for.me), mean3 = mean(Have.more.energy), mean4 = mean(Am.more.physically.active))
        social.life.means <-  time.data %>% select(mean1, mean2, mean3, mean4) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      else if(input[[paste0(gsub(' ', '', centers[i]), "_answer")]] == sectors[3]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Feel.happier.or.more.satisfied.with.my.life), mean2 = mean(Have.something.to.look.forward.to.each.day))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      else if(input[[paste0(gsub(' ', '', centers[i]), "_answer")]] == sectors[4]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide), mean2 = mean(Have.learned.about.services.and.benefits))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      
      else if(input[[paste0(gsub(' ', '', centers[i]), "_answer")]] == sectors[5]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(total_mean = mean(Feel.more.able.to.stay.independent))
      }
      
      else if(input[[paste0(gsub(' ', '', centers[i]), "_answer")]] == sectors[6]) {
        time.data <- cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Would.recommend.the.senior.center.to.a.friend.or.family.member), mean2 = mean(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life))
        social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
        time.data$total_mean <- social.life.means
      }
      time.data <- time.data %>% mutate(Mean = round(total_mean, digits=2))
      ggplot(time.data, aes(x=Batch, y=Mean, group = 1)) + geom_point(color='#0275d8') + geom_line(color='#0275d8') + ylim(1,3) + ylab('Mean Index')
    })
    
    bar_data <- data %>% filter(SiteID == centers[i])
    output[[(paste0(gsub(' ', '', centers[i]), '_bar'))]] <- renderPlotly({
      if(input[[paste0(gsub(' ', '', centers[i]), '_answer')]]== sectors[1]) {
        sum1 <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(See.friends.more.often.make.new.friends) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      else if(input[[paste0(gsub(' ', '', centers[i]), '_answer')]] == sectors[2]) {
        sum1 <- bar_data %>% group_by(Take.better.care.of.my.health) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Eat.meals.that.are.better.for.me) %>% summarise(count2 = n())
        sum3 <- bar_data %>% group_by(Have.more.energy) %>% summarise(count3 = n())
        sum4 <- bar_data %>% group_by(Am.more.physically.active) %>% summarise(count4 = n())
        sum1$total_count <- sum1$count1 + sum2$count2 + sum3$count3 + sum4$count4
        names(sum1)[1] <- 'categories'
      }
      else if(input[[paste0(gsub(' ', '', centers[i]), '_answer')]] == sectors[3]) {
        sum1 <- bar_data %>% group_by(Feel.happier.or.more.satisfied.with.my.life) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Have.something.to.look.forward.to.each.day) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      else if(input[[paste0(gsub(' ', '', centers[i]), '_answer')]] == sectors[4]) {
        sum1 <- bar_data %>% group_by(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide) %>% summarise(count1 = n())
        sum2 <- bar_data %>% group_by(Have.learned.about.services.and.benefits) %>% summarise(count2 = n())
        sum1$total_count <- sum1$count1 + sum2$count2
        names(sum1)[1] <- 'categories'
      }
      
      else if(input[[paste0(gsub(' ', '', centers[i]), '_answer')]] == sectors[5]) {
        sum1 <- bar_data %>% group_by(Feel.more.able.to.stay.independent) %>% summarise(total_count = n())
        names(sum1)[1] <- 'categories'
      }
      
      else if(input[[paste0(gsub(' ', '', centers[i]), '_answer')]] == sectors[6]) {
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
  
  
  output$race <- renderPlotly({
    
    grouped.race.data <- data %>% group_by(Race)  %>% summarise(Count = n()) %>% 
                            filter((Race == 'White or Caucasian') | 
                                     (Race == 'American Indian or Alaska Native') | 
                                     (Race == 'Asian, Asian-American') | 
                                     (Race == 'Hispanic, Latino') | 
                                     (Race == 'Black, African-American, Other African') | 
                                     (Race == 'Other') | 
                                     (Race == 'Two or More') | 
                                     (Race == 'Hawaiian Native or Pacific Islander')) %>% 
                            mutate(Race = reorder(Race,Count))
    ggplotly(ggplot(grouped.race.data, aes(x=Race, y=Count)) + 
               geom_bar(stat="identity", color = '#0275d8', fill='#0275d8')+ 
               coord_flip() + ylab("Count") + xlab("Racial Breakdown") + 
               ggtitle("Racial Breakdown of All Centers") + 
               theme(axis.title.x = element_text(margin = margin(l = 20)))) 
    
  })
  
  
}