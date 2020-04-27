output$bar <- renderPlotly({
  if (input$select1 == "ACRS") {
    filtered <- filter(data, SiteID == "ACRS")
  }
  else if (input$select1 == "Greenwood") {
    filtered <- filter(data, SiteID == "Greenwood")
  }
  else if (input$select1 == "IDIC") {
    filtered <- filter(data, SiteID == "IDIC")
  }
  else if (input$select1 == "PMSC") {
    filtered <- filter(data, SiteID == "PMSC")
  }
  else if (input$select1 == "Sunshine Garden") {
    filtered <- filter(data, SiteID == "Sunshine Garden")
  }
  else if (input$select1 == "Wallingford") {
    filtered <- filter(data, SiteID == "Wallingford")
  }
  else if (input$select1 == "CISC") {
    filtered <- filter(data, SiteID == "CISC")
  }
  else if (input$select1 == "South Park") {
    filtered <- filter(data, SiteID == "South Park")
  }
  else if (input$select1 == "GWP") {
    filtered <- filter(data, SiteID == "GWP")
  }
  else if (input$select1 == "Southeast") {
    filtered <- filter(data, SiteID == "Southeast")
  }
  if (input$select2 == "ACRS") {
    filtered2 <- filter(data, SiteID == "ACRS")
  }
  else if (input$select2 == "Greenwood") {
    filtered2 <- filter(data, SiteID == "Greenwood")
  }
  else if (input$select2 == "IDIC") {
    filtered2 <- filter(data, SiteID == "IDIC")
  }
  else if (input$select2 == "PMSC") {
    filtered2 <- filter(data, SiteID == "PMSC")
  }
  else if (input$select2 == "Sunshine Garden") {
    filtered2 <- filter(data, SiteID == "Sunshine Garden")
  }
  else if (input$select2 == "Wallingford") {
    filtered2 <- filter(data, SiteID == "Wallingford")
  }
  else if (input$select2 == "CISC") {
    filtered2 <- filter(data, SiteID == "CISC")
  }
  else if (input$select2 == "South Park") {
    filtered2 <- filter(data, SiteID == "South Park")
  }
  else if (input$select2 == "GWP") {
    filtered2 <- filter(data, SiteID == "GWP")
  }
  else if (input$select2 == "Southeast") {
    filtered2 <- filter(data, SiteID == "Southeast")
  }
  filtered3 <- rbind(filtered, filtered2)
  if (input$select3 == "Do more volunteer work") {
    x_value <- filtered3$Do.more.volunteer.work
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Do.more.volunteer.work) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "See friends more often/make new friends") {
    x_value <- filtered3$See.friends.more.often.make.new.friends
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(See.friends.more.often.make.new.friends) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Take better care of my health") {
    x_value <- filtered3$Take.better.care.of.my.health
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Take.better.care.of.my.health) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Eat meals that are better for me") {
    x_value <- filtered3$Eat.meals.that.are.better.for.me
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Eat.meals.that.are.better.for.me) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Have more energy") {
    x_value <- filtered3$Have.more.energy
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Have.more.energy) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Feel happier or more satisfied with my life") {
    x_value <- filtered3$Feel.happier.or.more.satisfied.with.my.life
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Feel.happier.or.more.satisfied.with.my.life) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Have something to look forward to each day") {
    x_value <- filtered3$Have.something.to.look.forward.to.each.day
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Have.something.to.look.forward.to.each.day) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Know where to ask if I need service such as a ride to doctor") {
    x_value <- filtered3$Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Feel more able to stay independent") {
    x_value <- filtered3$Feel.more.able.to.stay.independent
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Feel.more.able.to.stay.independent) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Feel that the senior center has had a positive effect on my life") {
    x_value <- filtered3$Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Learn new things") {
    x_value <- filtered3$Learn.new.things
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Learn.new.things) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Have learned about services and benefits") {
    x_value <- filtered3$Have.learned.about.services.and.benefits
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Have.learned.about.services.and.benefits) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Am more physically active") {
    x_value <- filtered3$Am.more.physically.active
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Am.more.physically.active) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "Would recommend the senior center to a friend or family member") {
    x_value <- filtered3$Would.recommend.the.senior.center.to.a.friend.or.family.member
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(Would.recommend.the.senior.center.to.a.friend.or.family.member) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "What is your zip code") {
    x_value <- filtered3$What.is.your.zip.code
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(What.is.your.zip.code) %>% mutate(Percent = n / sum(n)) 
  }
  else if (input$select3 == "What is your estimated annual income") {
    x_value <- filtered3$What.is.your.estimated.annual.income
    filtered4 <- filtered3 %>% group_by(SiteID) %>% count(What.is.your.estimated.annual.income) %>% mutate(Percent = n / sum(n)) 
  }
  #filtered3 <- rbind(filtered, filtered2)
  colnames(filtered4)[2] <- 'Question'
  ggplotly(ggplot(filtered4, aes(x=Question, y = Percent, fill=SiteID)) + 
    geom_bar(color = "lightgoldenrodyellow", stat='identity', position='dodge') +
    xlab("Question") + ylab("Percentage") +
    coord_flip() + theme(legend.position = 'bottom') + ggtitle('Comparing Survey Responses')
    ) %>% layout(legend = list(orientation = 'h', x = 0.4, y=-0.2))
  
})