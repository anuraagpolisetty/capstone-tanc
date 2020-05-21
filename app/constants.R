# library(googledrive)
# source("auth.R", local = T)
# This file is used to store all constant variables that can be accessed from any other file.
# Anyt changes or additions to this file will update accordingly in the overall dashboard.
# You can add a new center to the 'centers' variable which will automatically create a new
# tab for the center.
# Be sure to use '<<-' to store global variables that can be accessed from any other file


# If you would like to add a new center, add it to the end of this comma-seperated list.
# Replace the "New Center" line with the name of the center and delete the '#' symbol
centers <<- c("Asian Counseling and Referral Service", "Greenwood", "International Drop-In Center", "Pike Market Senior Center", "Sunshine Garden", 
              "Wallingford", "Sound Generations", "South Park", "Generations With Pride", "Southeast", "Central Area Senior Center"
              # ,"New_Center"
)


# Add new survey questions by adding it to the end of this comma-seperated list
all_questions <<- c("Do more volunteer work",
                    "See friends more often make new friends",
                    "Take better care of my health",
                    "Eat meals that are better for me",
                    "Have more energy",
                    "Feel happier or more satisfied with my life",
                    "Have something to look forward to each day",
                    "Know where to ask if I need a service such as a ride to a doctor or an aide",
                    "Feel more able to stay independent",
                    "Feel that the senior center has had a positive effect on my life",
                    "Learn new things",
                    "Have learned about services and benefits",
                    "Am more physically active",
                    "Would recommend the senior center to a friend or family member"
                    # ,"Extra question"
                    )


batches <<- c("2015-1", "2015-2", "2016-1", "2016-2", "2017-1", "2017-2", "2018-1", "2018-2",
              "2019-1", "2019-2", "2020-1", "2020-2") # Add in 2021-1 and 2021-2 in here when necessary

answers <<- c("Almost Never", "Sometimes", "Most of the Time", "Not applicable")

sectors <<- c('Social', 'Physical', 'Positivity', 'Services', 'Independence', 'Overall')
index <<- c('SocialIndex', 'PhysicalIndex', 'PositiveIndex', 'ServicesIndex', 'IndependenceIndex', 'OverallIndex')

income_brackets <<- c("Very Low: Less than $18550 for 1 person; or $21,2000 for 2 people",
                     "Low: Less for than $30,900 for 1 person; or $35,300 for 2 people",
                     "Moderate: Less than $44,750 for 1 person; or $51,150 for 2 people",
                     "Above Moderate: More than $44,750 for 1 person; or $51,150 for 2 people", "N/A")

race_ethnicity <<- c("American Indian or Alaska Native",
                    "Asian, Asian-American",
                    "Black, African-American, Other African",
                    "Hawaiian Native or Pacific Islander",
                    "Hispanic, Latino",
                    "Other",
                    "White or Caucasian",
                    "Two or More",
                    "N/A")

# Keep all spreadsheet IDs and center names in a single globally-accessible dataframe
# Updates google sheets even when a new center is added
# drive_auth(path = ".secrets")

# drive_auth(cache = ".secrets", email = TRUE)
# 
# ids <- vector()
# for (c in centers) {
#   id <- drive_get(c)$id
# 
#     # IF no sheet id is found, create a new google sheet (with column names)
#     if(length(id) == 0) {
#       id <- createNewSheet(c)
#     }
# 
#   # Continue saving sheet id to center_ids dataframe
#   ids[c] <- id
# }
#
## Store all center IDs in globally-accessible dataframe
# center_ids <<- data.frame(center=centers, id=ids)
