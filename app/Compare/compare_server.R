source('./constants.R')
output$bar <- renderPlotly({
  filtered <- data %>% filter(SiteID == input$select1)
  filtered2 <- data %>% filter(SiteID == input$select2)
  filtered3 <- rbind(filtered, filtered2)
  question <- gsub(' ', '.', input$select3)
  filtered4 <- filtered3 %>% drop_na(!!sym(question)) %>% group_by(SiteID) %>% count(!!sym(question)) %>% mutate(Percent = n / sum(n))
  colnames(filtered4)[2] <- 'Question'
  
  ggplotly(ggplot(filtered4, aes(x=Question, y = (round(Percent, digits=2) * 100), fill=SiteID, text=paste0('Response: ', Question, '<br>', 'Percentage: ', (round(Percent, digits=2) * 100), '%', '<br>', 'Location: ', SiteID))) + 
    geom_bar(color = "lightgoldenrodyellow", stat='identity', position='dodge') +
    xlab("Response") + ylab("Percentage") +
    coord_flip() + theme(legend.position = 'bottom') + ggtitle('Comparing Survey Responses'), tooltip='text') %>% layout(legend = list(orientation = 'h', x = 0.4, y=-0.2))
  
})