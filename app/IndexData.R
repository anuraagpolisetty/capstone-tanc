library(dplyr)
library(plotly)

allData <- final_data
#allData <- read.csv(file="data/TOTAL.csv", stringsAsFactors=FALSE)

# Convert df to index scale (1-3)
IndexData <- function(df) {
  questions <- colnames(df)[4:17]
  for (q in questions) {
    df[is.na(df[q]), q] <- '0'
    df[df[q] == 'Not Applicable',q] <- '0'
    df[df[q] == 'Almost Never',q] <- '1'
    df[df[q] == 'Sometimes',q] <- '2'
    df[df[q] == 'Most of the Time',q] <- '3'
    df[q] <- as.numeric(df[[q]])
  }
  return (df)
}


# create indexes for every target impact measure

SocialIndex <- function(df, site){
  if(site == "all"){
    # social.questions <- c(12, 13)
    social.life <- df[,c(4, 5)] #social.questions]
  }
  index <- mean(colMeans(social.life))
  return (index)
}
# social.index <- SocialIndex(data.2019, "all")


PhysicalIndex <- function(df, site) {
  if(site == "all"){
    # physical.questions <- c(14, 15, 16, 24)
    physical.health <- df[,c(6, 7, 8, 16)] #physical.questions]
  }
  index <- mean(colMeans(physical.health), na.rm=TRUE)
  return (index)
}
# physical.index <- PhysicalIndex(data.2019, "all")


PositiveIndex <- function(df, site) {
  if(site == "all") {
    # positive.questions <- c(17, 18, 22)
    positive.outlook <- df[, c(9, 10, 14)] #positive.questions]
  }
  index <- mean(colMeans(positive.outlook, na.rm=TRUE))
  return (index)
}
# positive.index <- PositiveIndex(data.2019, "all")



ServicesIndex <- function(df, site) {
  if(site == "all") {
    # services.questions <- c(19, 23)
    access.to.services <- df[,c(11, 15)] #services.questions]
  }
  index <- mean(colMeans(access.to.services, na.rm=TRUE))
  return (index)
}
# services.index <- ServicesIndex(data.2019, "all")


IndependenceIndex <- function(df, site) {
  if(site == "all"){
    # independence.questions <- c(20)
    independence <- df[, 12] # independence.questions]
  }
  index <- mean(independence, na.rm = TRUE)
  return (index)
}
# independence.index <- IndependenceIndex(data.2019, "all")


OverallIndex <- function(df, site) {
  if(site == "all") {
    # satisfaction.questions <- c(21,25)
    overall.satisfaction <- df[,c(13,17)] # satisfaction.questions]
  }
  index <- mean(colMeans(overall.satisfaction, na.rm=TRUE))
  return (index)
}
# satisfaction.index <- OverallSatisfactionIndex(data.2019, "all")
