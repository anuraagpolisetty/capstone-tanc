library(dplyr)
library(ggplot2)
library(tidyverse)
library(googledrive)
library(googlesheets4)
# data <- final_data
# data <- read.csv(file="./data/TOTAL.csv", stringsAsFactors=FALSE)

drive_auth(cache = ".secrets", email = TRUE)
gs4_auth(token = drive_token())

total <- drive_get("total")
total_id <- unclass(as_sheets_id(total))
total_data <- range_speedread(total_id)
# View(total_data)
data <- data.frame(total_data)

# Gets the data ready for a single center
#data_single_center <- data %>% filter(SiteID == 'ACRS')
#bar_data <- data_single_center  
# Clean the data for the visuals

column.names <- names(data)
questions <- column.names[4:17]


# Gets the data ready for a single center
cleaned_data <- data
# Clean the data for the visuals

column.names <- names(cleaned_data)
questions <- column.names[4:17]


for (question in questions) {
  cleaned_data[is.na(cleaned_data[question]), question] <- '0'
  cleaned_data[cleaned_data[question] == 'Not Applicable',question] <- '0'
  cleaned_data[cleaned_data[question] == 'Almost Never',question] <- '1'
  cleaned_data[cleaned_data[question] == 'Sometimes',question] <- '2'
  cleaned_data[cleaned_data[question] == 'Most of the Time',question] <- '3'
  cleaned_data[question] <- as.numeric(cleaned_data[[question]])
  
}











# Data exploration


# batch <- data %>% group_by(Batch) %>% summarise(count = n())
# 
# social.life <- cleaned_data %>% group_by(Batch) %>% summarise(mean1 = mean(Do.more.volunteer.work), mean2 = mean(See.friends.more.often.make.new.friends))
# 
# social.life.means <- social.life %>% select(mean1, mean2) %>% rowMeans()
# 
# social.life$total_mean <- social.life.means

# Explore Bar

# grouped_data <- bar_data %>% group_by(Do.more.volunteer.work, See.friends.more.often.make.new.friends) %>% summarise(count = n()) #%>% filter(Do.more.volunteer.work == See.friends.more.often.make.new.friends)
# 
# single_center_bar <- ggplot(grouped_data, aes(x=reorder(Do.more.volunteer.work, -count),count))+geom_bar(stat="identity")
# 
# first <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count1 = n())# %>% rename(c(Do.more.volunteer.work = 'categories'))
# second <- bar_data %>% group_by(See.friends.more.often.make.new.friends) %>% summarise(count2 = n())

#cleaned_data <- cleaned_data %>% group_by(SiteID) %>% summarise(count=n())


###################### Test New CSV #######################

cleaned_data %>% group_by(SiteID) %>% summarise(count=n())
west_cleaned <- cleaned_data %>% filter(SiteID == 'West Seattle')

############## Fix Total CSV Racial Columns ###########################

# new.csv.data <- data %>% unite('New.Race', Race...American.Indian.or.Alaska.Native:Race...White.or.Caucasian, na.rm = TRUE, remove=FALSE)
# `%notin%` = Negate(`%in%`)
# #new.csv.data <- new.csv.data[(new.csv.data$New.Race != ''), "New.Race"]
# new.csv.data[(new.csv.data$New.Race != '') &(new.csv.data$New.Race != 'American Indian or Alaska Native') & (new.csv.data$New.Race != 'Asian, Asian-American') & (new.csv.data$New.Race %notin% 'Black, African-American, Other African') & ('Hawaiian Native or Pacific Islander' != new.csv.data$New.Race) & ('Hispanic, Latino' != new.csv.data$New.Race) &('Other' != new.csv.data$New.Race) & ('White or Caucasian' != new.csv.data$New.Race), "New.Race" ] <- "Two or More"
# new.csv.data <- new.csv.data %>% unite('Final.Race', c('Race', 'New.Race'), sep='', na.rm= TRUE, remove = FALSE)
# filePath <- file.path("C:\\Users\\Tabit\\OneDrive\\Capstone\\", "new.total.csv")
# write.csv(new.csv.data, filePath)
