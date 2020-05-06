# total.data.csv <- read.csv("data/TOTAL.csv")
# combined.data.17.first.batch <- read.csv('data/Combined_Data_2017_1st_Batch.csv')
# combined.data.17.second.batch <- read.csv('data/Combined_Data_2017_2nd_Batch.csv')
# senior.results <- read.csv('data/SENIORSURVEY_RESULTS_2015_2017.csv')
# senior.center.locations <- read.csv('data/Senior_Center_Locations_Cleaned.csv')
# 
# responses.by.center <- read.csv('data/Responses_By_Center.csv')
# grouped <- responses.by.center %>% group_by(SiteName) %>% summarise(count = n())
# 
# ############# Get West Seattle Data
# west.seattle.1 <- read.csv('West_Seattle_2018_1.csv')
# west.seattle.1 <- west.seattle.1 %>% select(-1)
# sound.gen <- read.csv('Sound_gen_2018_2.csv')
# west.seattle.2 <- read.csv('west_seattle_2018_2.csv')
# 
# total.west.seattle.2 <- rbind(sound.gen, west.seattle.2)
# names(total.west.seattle.2)[1] <- 'RespondentID'
# #total.west.seattle <- rbind(total.west.seattle, west.seattle.1)
# 
# total.west.seattle.2 <- add_column(total.west.seattle.2, CollectorID = 1, .after = "RespondentID")
# total.west.seattle.2 <- add_column(total.west.seattle.2, Batch = "2018-2", .after = "CollectorID")
# total.west.seattle.2 <- add_column(total.west.seattle.2, IP.Address = "NA", .after = "EndDate")
