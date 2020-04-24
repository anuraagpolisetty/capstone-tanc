library(shiny)
library(ggplot2)
library(bs4Dash)
library(rsconnect)
source('scripts/Tabitha_Analysis.R')
source('scripts/GaugeChart.R')

southeast_cleaned_data <- cleaned_data %>% filter(SiteID == 'Southeast')


output$southeast_gauge <- renderPlotly({
  
  wallingford.data.2019 <- data.2019 %>% filter(SiteID == 'Southeast')   
  GaugeChart(wallingford.data.2019, OverallIndex, "all", "2019", 'rgb(255,255,255)')
  
})

output$social_southeast <- renderPlotly({
  if(input$southeast_gauge == 1) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$southeast_gauge == 2) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(wallingford.date.data, SocialIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$physical_southeast <- renderPlotly({
  if(input$southeast_gauge == 1) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$southeast_gauge == 2) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(wallingford.date.data, PhysicalIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$positive_southeast <- renderPlotly({
  if(input$southeast_gauge == 1) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$southeast_gauge == 2) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(wallingford.date.data, PositiveIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$services_southeast <- renderPlotly({
  if(input$southeast_gauge == 1) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$southeast_gauge == 2) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(wallingford.date.data, ServicesIndex, 'all', date,'rgb(255,255,255)')
  
})

output$independence_southeast <- renderPlotly({
  if(input$southeast_gauge == 1) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$southeast_gauge == 2) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  
  GaugeChart(wallingford.date.data, IndependenceIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$general_southeast <- renderPlotly({
  if(input$southeast_gauge == 1) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2017-1' | Batch == '2017-2')
    date <- '2017'
  }
  else if(input$southeast_gauge == 2) {
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2018-1' | Batch == '2018-2')
    date <- '2018'
  }
  else{
    wallingford.date.data <- southeast_cleaned_data %>%  filter(Batch == '2019-1' | Batch == '2019-2')
    date <- '2019'    
  }
  GaugeChart(wallingford.date.data, OverallIndex, 'all', date, 'rgb(255,255,255)')
  
})

output$southeast_timeplot <-  renderPlot({
  if(input$southeast_answer == 1) {
    time.data <- southeast_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Do.more.volunteer.work), mean2 = mean(See.friends.more.often.make.new.friends))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  else if(input$southeast_answer == 2) {
    time.data <- southeast_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Take.better.care.of.my.health), mean2 = mean(Eat.meals.that.are.better.for.me), mean3 = mean(Have.more.energy), mean4 = mean(Am.more.physically.active))
    social.life.means <-  time.data %>% select(mean1, mean2, mean3, mean4) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  else if(input$southeast_answer == 3) {
    time.data <- southeast_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Feel.happier.or.more.satisfied.with.my.life), mean2 = mean(Have.something.to.look.forward.to.each.day))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  else if(input$southeast_answer == 4) {
    time.data <- southeast_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide), mean2 = mean(Have.learned.about.services.and.benefits))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  
  else if(input$southeast_answer == 5) {
    time.data <- southeast_cleaned_data %>% group_by(Batch) %>%  summarise(total_mean = mean(Feel.more.able.to.stay.independent))
  }
  
  else if(input$southeast_answer == 6) {
    time.data <- southeast_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Would.recommend.the.senior.center.to.a.friend.or.family.member), mean2 = mean(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life))
    social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
    time.data$total_mean <- social.life.means
  }
  
  ggplot(time.data, aes(x=Batch, y=total_mean, group=1)) + geom_point() + geom_line() 
})

output$southeast_bar <-  renderPlot({
  if(input$southeast_answer == 1) {
    sum1 <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count1 = n())
    sum2 <- bar_data %>% group_by(See.friends.more.often.make.new.friends) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  else if(input$southeast_answer == 2) {
    sum1 <- bar_data %>% group_by(Take.better.care.of.my.health) %>% summarise(count1 = n())
    sum2 <- bar_data %>% group_by(Eat.meals.that.are.better.for.me) %>% summarise(count2 = n())
    sum3 <- bar_data %>% group_by(Have.more.energy) %>% summarise(count3 = n())
    sum4 <- bar_data %>% group_by(Am.more.physically.active) %>% summarise(count4 = n())
    sum1$total_count <- sum1$count1 + sum2$count2 + sum3$count3 + sum4$count4
    names(sum1)[1] <- 'categories'
  }
  else if(input$southeast_answer == 3) {
    sum1 <- bar_data %>% group_by(Feel.happier.or.more.satisfied.with.my.life) %>% summarise(count1 = n())
    sum2 <- bar_data %>% group_by(Have.something.to.look.forward.to.each.day) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  else if(input$southeast_answer == 4) {
    sum1 <- bar_data %>% group_by(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide) %>% summarise(count1 = n())  
    sum2 <- bar_data %>% group_by(Have.learned.about.services.and.benefits) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  
  else if(input$southeast_answer == 5) {
    sum1 <- bar_data %>% group_by(Feel.more.able.to.stay.independent) %>% summarise(total_count = n()) 
    names(sum1)[1] <- 'categories'
  }
  
  else if(input$southeast_answer == 6) {
    sum1 <- bar_data %>% group_by(Would.recommend.the.senior.center.to.a.friend.or.family.member) %>% summarise(count1 = n()) 
    sum2 <- bar_data %>% group_by(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life) %>% summarise(count2 = n())
    sum1$total_count <- sum1$count1 + sum2$count2
    names(sum1)[1] <- 'categories'
  }
  
  ggplot(sum1, aes(x=reorder(categories, -total_count),total_count))+geom_bar(stat="identity")
})