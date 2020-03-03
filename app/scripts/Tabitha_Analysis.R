library(dplyr)
library(ggplot2)
library(tidyverse)
data <- read.table("C:/Users/Tabit/OneDrive/Capstone/capstone-tanc/data/Total.csv",
                    header=TRUE, sep=",", stringsAsFactors = FALSE)

# Gets the data ready for a single center
data_single_center <- data %>% filter(SiteID == 'ACRS')
bar_data <- data_single_center  
# Clean the data for the visuals

column.names <- names(data)
questions <- column.names[12:25]


for (question in questions) {
  print(question)
  data_single_center[is.na(data_single_center[question]), question] <- '0'
  data_single_center[data_single_center[question] == 'Not Applicable',question] <- '0'
  data_single_center[data_single_center[question] == 'Almost Never',question] <- '1'
  data_single_center[data_single_center[question] == 'Sometimes',question] <- '2'
  data_single_center[data_single_center[question] == 'Most of the Time',question] <- '3'
  data_single_center[question] <- as.numeric(data_single_center[[question]])
  
}
  
#Visualization #1 Changes Over Time (Line or scatter plot)

dates_grouped <- data_single_center %>% group_by(Batch) %>% summarise(mean_score = mean(Do.more.volunteer.work, na.rm=TRUE))

ggplot(dates_grouped, aes(x=Batch, y=mean_score, group=1)) + geom_line() + geom_point()
  
# Visualization #2 Stacked Bar chart. Filter on question!
# Remove all NA values

bar_data <- bar_data[!is.na(data_single_center$Do.more.volunteer.work),]

grouped_data <- bar_data %>% group_by(Do.more.volunteer.work) %>% summarise(count = n())
  
ggplot(grouped_data, aes(x=reorder(Do.more.volunteer.work, -count),count))+geom_bar(stat="identity")


# Visualization #3 Race and Ethnicity

ethnicity_grouped <- data_single_center %>% group_by()

