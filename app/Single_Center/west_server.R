library(shiny)
library(ggplot2)
library(bs4Dash)
library(rsconnect)
source('scripts/Tabitha_Analysis.R')
source('scripts/GaugeChart.R')
#source('Map/general_exploration.R')

west_cleaned_data <- cleaned_data %>% filter(SiteID == 'West Seattle')

# west_cleaned_data <- west_cleaned_data
# column.names <- names(west_cleaned_data)
# questions <- column.names[12:25]
# for (question in questions) {
#   west_cleaned_data[is.na(west_cleaned_data[question]), question] <- '0'
# }

output$west_gauge <- renderPlotly({
  
  west.data.2018 <- data.2018 %>% filter(SiteID == 'West Seattle')   
  GaugeChart(west.data.2018, OverallIndex, "all", "2018", 'rgb(255,255,255)')
  
})

output$social_west <- renderPlotly({
  if(input$west_gauge == 1) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$west_gauge == 2) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(west.date.data, SocialIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$physical_west <- renderPlotly({
  if(input$west_gauge == 1) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$west_gauge == 2) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(west.date.data, PhysicalIndex, 'all', date,  'rgb(255,255,255)')
  
})

output$positive_west <- renderPlotly({
  if(input$west_gauge == 1) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$west_gauge == 2) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(west.date.data, PositiveIndex, 'all', date,'rgb(255,255,255)')
  
})

output$services_west <- renderPlotly({
  if(input$west_gauge == 1) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$west_gauge == 2) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(west.date.data, ServicesIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$independence_west <- renderPlotly({
  if(input$west_gauge == 1) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$west_gauge == 2) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(west.date.data, IndependenceIndex, 'all', date,'rgb(255,255,255)')
  
})

output$general_west <- renderPlotly({
  if(input$west_gauge == 1) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$west_gauge == 2) {
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    west.date.data <- west_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  GaugeChart(west.date.data, OverallIndex, 'all', date,'rgb(255,255,255)')
  
})

output$west_timeplot <-  renderPlotly({
  if(input$west_answer == 1) {
    time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Do.more.volunteer.work), mean2 = mean(See.friends.more.often.make.new.friends))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  else if(input$west_answer == 2) {
    time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Take.better.care.of.my.health), mean2 = mean(Eat.meals.that.are.better.for.me), mean3 = mean(Have.more.energy), mean4 = mean(Am.more.physically.active))
    social.life.means <-  time.data %>% select(mean1, mean2, mean3, mean4) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  else if(input$west_answer == 3) {
    time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Feel.happier.or.more.satisfied.with.my.life), mean2 = mean(Have.something.to.look.forward.to.each.day))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  else if(input$west_answer == 4) {
    time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide), mean2 = mean(Have.learned.about.services.and.benefits))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  
  else if(input$west_answer == 5) {
    time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(total_mean = mean(Feel.more.able.to.stay.independent))
  }
  
  else if(input$west_answer == 6) {
    time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Would.recommend.the.senior.center.to.a.friend.or.family.member), mean2 = mean(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  time.data <- time.data %>% mutate(Mean = total_mean)
  ggplot(time.data, aes(x=Batch, y=Mean, group = 1)) + geom_point(color='#0275d8') + geom_line(color='#0275d8') + ylim(1,3)
})

output$west_bar <-  renderPlotly({
  if(input$west_answer == 1) {
    sum1 <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count1 = n())
    sum2 <- bar_data %>% group_by(See.friends.more.often.make.new.friends) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  else if(input$west_answer == 2) {
    sum1 <- bar_data %>% group_by(Take.better.care.of.my.health) %>% summarise(count1 = n())
    sum2 <- bar_data %>% group_by(Eat.meals.that.are.better.for.me) %>% summarise(count2 = n())
    sum3 <- bar_data %>% group_by(Have.more.energy) %>% summarise(count3 = n())
    sum4 <- bar_data %>% group_by(Am.more.physically.active) %>% summarise(count4 = n())
    sum1$total_count <- sum1$count1 + sum2$count2 + sum3$count3 + sum4$count4
    names(sum1)[1] <- 'categories'
  }
  else if(input$west_answer == 3) {
    sum1 <- bar_data %>% group_by(Feel.happier.or.more.satisfied.with.my.life) %>% summarise(count1 = n())
    sum2 <- bar_data %>% group_by(Have.something.to.look.forward.to.each.day) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  else if(input$west_answer == 4) {
    sum1 <- bar_data %>% group_by(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide) %>% summarise(count1 = n())  
    sum2 <- bar_data %>% group_by(Have.learned.about.services.and.benefits) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  
  else if(input$west_answer == 5) {
    sum1 <- bar_data %>% group_by(Feel.more.able.to.stay.independent) %>% summarise(total_count = n()) 
    names(sum1)[1] <- 'categories'
  }
  
  else if(input$west_answer == 6) {
    sum1 <- bar_data %>% group_by(Would.recommend.the.senior.center.to.a.friend.or.family.member) %>% summarise(count1 = n()) 
    sum2 <- bar_data %>% group_by(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  sum1 <- sum1 %>% mutate(Categories = fct_reorder(categories, -total_count), Count = total_count)
  ggplot(sum1, aes(x=Categories,y=Count))+geom_bar(stat="identity", color = '#0275d8', fill='#0275d8')+ xlab('Survey Responses') + ylab('Count')
})

