output$bar <- renderPlot({
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
  }
  else if (input$select3 == "See friends more often/make new friends") {
    x_value <- filtered3$See.friends.more.often.make.new.friends
  }
  else if (input$select3 == "Take better care of my health") {
    x_value <- filtered3$Take.better.care.of.my.health
  }
  else if (input$select3 == "Eat meals that are better for me") {
    x_value <- filtered3$Eat.meals.that.are.better.for.me
  }
  else if (input$select3 == "Have more energy") {
    x_value <- filtered3$Have.more.energy
  }
  else if (input$select3 == "Feel happier or more satisfied with my life") {
    x_value <- filtered3$Feel.happier.or.more.satisfied.with.my.life
  }
  else if (input$select3 == "Have something to look forward to each day") {
    x_value <- filtered3$Have.something.to.look.forward.to.each.day
  }
  else if (input$select3 == "Know where to ask if I need service such as a ride to doctor") {
    x_value <- filtered3$Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide
  }
  else if (input$select3 == "Feel more able to stay independent") {
    x_value <- filtered3$Feel.more.able.to.stay.independent
  }
  else if (input$select3 == "Feel that the senior center has had a positive effect on my life") {
    x_value <- filtered3$Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life
  }
  else if (input$select3 == "Learn new things") {
    x_value <- filtered3$Learn.new.things
  }
  else if (input$select3 == "Have learned about services and benefits") {
    x_value <- filtered3$Have.learned.about.services.and.benefits
  }
  else if (input$select3 == "Am more physically active") {
    x_value <- filtered3$Am.more.physically.active
  }
  else if (input$select3 == "Would recommend the senior center to a friend or family member") {
    x_value <- filtered3$Would.recommend.the.senior.center.to.a.friend.or.family.member
  }
  else if (input$select3 == "What is your zip code") {
    x_value <- filtered3$What.is.your.zip.code
  }
  else if (input$select3 == "What is your estimated annual income") {
    x_value <- filtered3$What.is.your.estimated.annual.income
  }
  filtered3 <- rbind(filtered, filtered2)
  ggplot(filtered3, aes(x_value, fill=SiteID)) + 
    geom_bar(position="dodge", stat="count", color = "lightgoldenrodyellow") +
    xlab("Question") + ylab("Count") +
    coord_flip()
})