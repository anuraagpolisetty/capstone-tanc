all.data <- read.csv("./data/TOTAL.csv")
locations.data <- read.csv("data/Senior_Center_Locations_Cleaned.csv")

column.names <- names(all.data)
questions <- column.names[12:25]

# To change global variable questions to total.csv
# column name format.
names <- colnames(all.data)
for(name in all_questions){
  #print(name)
  print(gsub(' ', '.', name))
  print(all.data %>% group_by(SiteID) %>% count(gsub(' ', '.', name)) %>% mutate(Percent = n / sum(n)))
}
#  Find why 2017 isn't showing for west seattle and ballard

grouped_for_ballard <- all.data %>% filter(SiteID == 'Ballard')
grouped_for_ballard <- grouped_for_ballard %>% group_by(Batch) %>% summarise(count = n())
################################################# Percentages #######################################################
# Shows the percentage of every response type for every question

total.responses <- nrow(all.data)
almostnever.list <- c()
sometime.list <- c()
always.list <- c()

for (question in questions) {
  print(question)
  all.data.no.na <- all.data[!is.na(all.data[question]),]
  almostnever.list <- c(almostnever.list, ((nrow(all.data.no.na[all.data.no.na[question] == 'Almost Never',])) / total.responses))
  sometime.list <- c(sometime.list, ((nrow(all.data.no.na[all.data.no.na[question] == 'Sometimes',])) / total.responses))
  always.list <- c(always.list, ((nrow(all.data.no.na[all.data.no.na[question] == 'Most of the Time',])) / total.responses))
}

# Test Percentage
test.response <- all.data[all.data['Do.more.volunteer.work'] == 'Sometimes',]
test.response <- test.response[!is.na(test.response$Do.more.volunteer.work),]
test.percentage <- nrow(test.response) / total.responses

see.friends.response <- all.data[all.data$See.friends.more.often.make.new.friends == 'Sometimes',]

######################################### By Sectors ########################################

all.data.no.na <- all.data.no.na[(all.data.no.na$Batch == '2019-1') | (all.data.no.na$Batch == '2019-2'),]

social.life.df <- all.data.no.na %>% select(Do.more.volunteer.work, See.friends.more.often.make.new.friends)
social.percentage.sometimes <- (nrow(social.life.df[social.life.df$Do.more.volunteer.work == 'Sometimes',]) + nrow(social.life.df[social.life.df$See.friends.more.often.make.new.friends == 'Sometimes',])) / (nrow(all.data.no.na) * 2)
social.percentage.almostnever <- (nrow(social.life.df[social.life.df$Do.more.volunteer.work == 'Almost Never',]) + nrow(social.life.df[social.life.df$See.friends.more.often.make.new.friends == 'Almost Never',])) / (nrow(all.data.no.na) * 2)
social.percentage.mostly <- (nrow(social.life.df[social.life.df$Do.more.volunteer.work == 'Most of the Time',]) + nrow(social.life.df[social.life.df$See.friends.more.often.make.new.friends == 'Most of the Time',])) / (nrow(all.data.no.na) * 2)

health.df <- all.data.no.na %>% select(Take.better.care.of.my.health, Eat.meals.that.are.better.for.me, Have.more.energy, Am.more.physically.active)
health.sometimes <- (nrow(health.df[health.df$Take.better.care.of.my.health == 'Sometimes',]) + nrow(health.df[health.df$Eat.meals.that.are.better.for.me == 'Sometimes',]) + nrow(health.df[health.df$Have.more.energy == 'Sometimes',]) + nrow(health.df[health.df$Am.more.physically.active == 'Sometimes',])) / (nrow(all.data.no.na) * 4)
health.almostnever <- (nrow(health.df[health.df$Take.better.care.of.my.health == 'Almost Never',]) + nrow(health.df[health.df$Eat.meals.that.are.better.for.me == 'Almost Never',]) + nrow(health.df[health.df$Have.more.energy == 'Almost Never',]) + nrow(health.df[health.df$Am.more.physically.active == 'Almost Never',])) / (nrow(all.data.no.na) * 4)
health.mostly <- (nrow(health.df[health.df$Take.better.care.of.my.health == 'Most of the Time',]) + nrow(health.df[health.df$Eat.meals.that.are.better.for.me == 'Most of the Time',]) + nrow(health.df[health.df$Have.more.energy == 'Most of the Time',]) + nrow(health.df[health.df$Am.more.physically.active == 'Most of the Time',])) / (nrow(all.data.no.na) * 4)

positive.outlook.df <- all.data.no.na %>% select(Feel.happier.or.more.satisfied.with.my.life, Have.something.to.look.forward.to.each.day)
positive.percentage.sometimes <- (nrow(positive.outlook.df[positive.outlook.df$Feel.happier.or.more.satisfied.with.my.life == 'Sometimes',]) + nrow(positive.outlook.df[positive.outlook.df$Have.something.to.look.forward.to.each.day == 'Sometimes',])) / (nrow(all.data.no.na) * 2)
positive.percentage.almostnever <- (nrow(positive.outlook.df[positive.outlook.df$Feel.happier.or.more.satisfied.with.my.life == 'Almost Never',]) + nrow(positive.outlook.df[positive.outlook.df$Have.something.to.look.forward.to.each.day == 'Almost Never',])) / (nrow(all.data.no.na) * 2)
positive.percentage.mostly <- (nrow(positive.outlook.df[positive.outlook.df$Feel.happier.or.more.satisfied.with.my.life == 'Most of the Time',]) + nrow(positive.outlook.df[positive.outlook.df$Have.something.to.look.forward.to.each.day == 'Most of the Time',])) / (nrow(all.data.no.na) * 2)

services.df <- all.data.no.na %>% select(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide, Have.learned.about.services.and.benefits)
services.percentage.sometimes <- (nrow(services.df[services.df$Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide == 'Sometimes',]) + nrow(services.df[services.df$Have.learned.about.services.and.benefits == 'Sometimes',])) / (nrow(all.data.no.na) * 2)
services.percentage.almostnever <- (nrow(services.df[services.df$Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide == 'Almost Never',]) + nrow(services.df[services.df$Have.learned.about.services.and.benefits == 'Almost Never',])) / (nrow(all.data.no.na) * 2)
services.percentage.mostly <- (nrow(services.df[services.df$Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide == 'Most of the Time',]) + nrow(services.df[services.df$Have.learned.about.services.and.benefits == 'Most of the Time',])) / (nrow(all.data.no.na) * 2)

independence.percentage.sometimes <- nrow(all.data.no.na[all.data.no.na$Feel.more.able.to.stay.independent == 'Sometimes',]) / nrow(all.data.no.na)
independence.percentage.almostnever <-nrow(all.data.no.na[all.data.no.na$Feel.more.able.to.stay.independent == 'Almost Never',]) / nrow(all.data.no.na)
independence.percentage.mostly <- nrow(all.data.no.na[all.data.no.na$Feel.more.able.to.stay.independent == 'Most of the Time',]) / nrow(all.data.no.na)

overall.df <- all.data.no.na %>% select(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life, Would.recommend.the.senior.center.to.a.friend.or.family.member)
overall.percentage.sometimes <- (nrow(overall.df[overall.df$Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life == 'Sometimes',]) + nrow(overall.df[overall.df$Would.recommend.the.senior.center.to.a.friend.or.family.member == 'Sometimes',])) / (nrow(all.data.no.na) * 2)
overall.percentage.almostnever <- (nrow(overall.df[overall.df$Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life == 'Almost Never',]) + nrow(overall.df[overall.df$Would.recommend.the.senior.center.to.a.friend.or.family.member == 'Almost Never',])) / (nrow(all.data.no.na) * 2)
overall.percentage.mostly <- (nrow(overall.df[overall.df$Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life== 'Most of the Time',]) + nrow(overall.df[overall.df$Would.recommend.the.senior.center.to.a.friend.or.family.member == 'Most of the Time',])) / (nrow(all.data.no.na) * 2)

almost.never <- c(social.percentage.almostnever, health.almostnever, positive.percentage.almostnever, services.percentage.almostnever, independence.percentage.almostnever, overall.percentage.almostnever)
sometimes <- c(social.percentage.sometimes, health.sometimes, positive.percentage.sometimes, services.percentage.sometimes, independence.percentage.sometimes, overall.percentage.sometimes)
most.of.the.time <- c(social.percentage.mostly, health.mostly, positive.percentage.mostly, services.percentage.mostly, independence.percentage.mostly, overall.percentage.mostly)

total.percentage.df <- data.frame('Almost Never' = almost.never, 'Sometimes' = sometimes, 'Most of the Time' = most.of.the.time, stringsAsFactors = FALSE)
row.names(total.percentage.df) <- c('Social Life', 'Physical Health', 'Positive Outlook', 'Access to Services', 'Independence', 'Overall Satisfaction')
########################################## Total Counts #############################
# Total counts of responses: 4405
total.responses

nrow(all.data[(all.data$Batch == '2019-1') | (all.data$Batch == '2019-2'),])

# Total Amount of Senior Centers: 11
data[data['SiteID'] == 'Greenwood Senior Center', 'SiteID'] <- 'Greenwood'
data[data['SiteID'] == 'South Park Senior Center', 'SiteID'] <- 'South Park'
data[data['SiteID'] == 'Wallingford Senior Center', 'SiteID'] <- 'Wallingford'
grouped.centers <- data %>% group_by(SiteID) %>% summarise(count = n())
total.centers <- nrow(grouped.centers)

# Total Batches inputted: 6
grouped.by.batch <- data %>% group_by(Batch) %>% summarise(count = n())
total.batches <- nrow(grouped.by.batch)


################################################ Over Time ###########################


######################### Fix the Compare Graph ##############################

filtered1 <- filter(data, SiteID == "CISC")
filtered2 <- filter(data, SiteID == 'Greenwood')
filtered3 <- rbind(filtered1, filtered2)
x_value <- filtered3$Do.more.volunteer.work

filtered4 <- filtered3 %>% drop_na(Do.more.volunteer.work) %>% group_by(SiteID) %>% count(Do.more.volunteer.work) %>% mutate(perc = n / sum(n)) 
#filtered4 <- filtered4 %>% mutate(Question = colnames(filtered4)[2])
colnames(filtered4)[2] <- 'Question'

ggplot(filtered4, aes_string(x=colnames(filtered4)[2], y = Question, fill=colnames(filtered4)[1])) + 
  geom_bar(color = "lightgoldenrodyellow", stat='identity', position='dodge') +
  xlab("Question") + ylab("Percentage") +
  coord_flip()

data1 <- filtered1
data2 <- data1 %>% drop_na(Do.more.volunteer.work) %>% count(Do.more.volunteer.work) %>% mutate(perc = n / sum(n))
ggplot(data2, aes_string(colnames(), y = perc)) + geom_bar(stat='identity')


test.data <- data(tips, package = "reshape2")
tips %>% 
  count(day) %>% 
  mutate(perc = n / nrow(tips)) -> tips2

ggplot(tips2, aes(x = day, y = perc)) + geom_bar(stat = "identity")

############################ Figure out Tooltips ###########################
sum1 <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count1 = n())
sum2 <- bar_data %>% group_by(See.friends.more.often.make.new.friends) %>% summarise(count2 = n())
sum1$total_count <- sum1$count1 + sum2$count2
names(sum1)[1] <- 'categories'
ggplot(sum1, aes(x=reorder(categories, -total_count),total_count))+geom_bar(stat="identity") + xlab('Questions') + ylab('Count')


########################## Get image to appear ########
library(OpenImageR)
path <- file.path(getwd(), 'imgs', 'pike2.jpg')
im <- readImage(path)
hold.image <-imageShow(im)
















######################### Test new data ###################

cleaned_data %>% group_by(SiteID) %>% summarise(count = n())
west_cleaned_data <- cleaned_data %>% filter(SiteID == 'West Seattle')


west.data.2018 <- data.2018 %>% filter(SiteID == 'West Seattle')   
GaugeChart(west.data.2018, OverallIndex, "all", "2018", 'rgb(255,255,255)')


# Time for new data
west_cleaned_time <- cleaned_data %>% filter(SiteID == 'West Seattle')
for (question in questions) {
  west_cleaned_time[is.na(west_cleaned_time[question]), question] <- '0'
}
time.data <- west_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Know.where.to.ask.if.I.need.a.service.such.as.a.ride.to.a.doctor.or.an.aide), mean2 = mean(Have.learned.about.services.and.benefits))
social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
time.data$total_mean <- social.life.means

pike_cleaned_data <- cleaned_data %>% filter(SiteID == 'PMSC' | SiteID == 'Pike Market Senior Center')
time.data <- pike_cleaned_data %>% group_by(Batch) %>%  summarise(mean1 = mean(Would.recommend.the.senior.center.to.a.friend.or.family.member), mean2 = mean(Feel.that.the.senior.center.has.had.a.positive.effect.on.my.life))
social.life.means <-  time.data %>% select(mean1, mean2) %>% rowMeans()
time.data$total_mean <- social.life.means


################## Get New Racial Breakdown #######################3

race.break <- data %>% unite('Race.Breakdown', Race...American.Indian.or.Alaska.Native:Race...White.or.Caucasian, na.rm = TRUE, remove=FALSE)
`%notin%` = Negate(`%in%`)
two.or.more <- race.break %>% filter((!is.na(Race.Breakdown)) & (Race.Breakdown != '') & (Race.Breakdown != 'American Indian or Alaska Native') & (Race.Breakdown != 'Asian, Asian-American') & (Race.Breakdown %notin% 'Black, African-American, Other African') & ('Hawaiian Native or Pacific Islander' != Race.Breakdown) & ('Hispanic, Latino' != Race.Breakdown) &('Other' != Race.Breakdown) & ('White or Caucasian' != Race.Breakdown)) 
grouped.by.race <- race.break %>% group_by(Race.Breakdown) %>% summarise(count=n()) %>% filter((Race.Breakdown != '')) %>% mutate(Race.Breakdown = reorder(Race.Breakdown,count))

races <- c()
counts <- c()
for(i in colnames(data[28:34])) {
  subset <- data %>% filter(!is.na(!!sym(i))) %>% group_by(!!sym(i)) %>% summarise(count = n())
  races <- c(races,toString(subset[,1]))
  counts <- c(counts, as.integer(subset[,2]))
}

races <- c(races, 'Two or More')
counts <- c(counts, nrow(two.or.more))

grouped.race.data <- data.frame('Race' = races, 'Count' = counts)
grouped.race.data <- grouped.race.data %>% mutate(Race = reorder(Race,Count))
ggplotly(ggplot(grouped.race.data, aes(x=Race, y=Count)) + geom_bar(stat="identity", color = '#0275d8', fill='#0275d8')+ coord_flip() + ylab("Count") + xlab("Racial Breakdown")+ ggtitle("Racial Breakdown of All Centers") + theme(axis.title.x = element_text(margin = margin(l = 20)))) 

# count <- c()
# for(i in data[28:34]){
#   print(!is.na(i))
#   n <- sum(!is.na(i), na.rm = FALSE)
#   count <- c(count,n)
# }
# race.data <- data.frame('race' = colnames(data)[28:34], 'counts' = count)
