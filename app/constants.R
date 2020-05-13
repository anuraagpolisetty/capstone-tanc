# File to store all constant variables that can be accessed from any other file
# Be sure to use '<<-' to store global variables

centers <<- c("ACRS", "Ballard", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", 
              "Wallingford", "West Seattle", "CISC", "South Park", "GWP", "Southeast")


batches <<- c("2015-1", "2015-2", "2016-1", "2016-2", "2017-1", "2017-2", "2018-1", "2018-2",
              "2019-1", "2019-2", "2020-1", "2020-2") # Add in 2021-1 and 2021-2 in here when necessary

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
                    "Would recommend the senior center to a friend or family member")
                    # ,"Extra question"


answers <<- c("Almost Never", "Sometimes", "Most of the Time", "Not applicable")

sectors <<- c('Social', 'Physical', 'Positivity', 'Services', 'Independence', 'Overall')
index <<- c('SocialIndex', 'PhysicalIndex', 'PositiveIndex', 'ServicesIndex', 'IndependenceIndex', 'OverallIndex')
# Do more volunteer work	See friends more often/make new friends	Take better care of my health	Eat meals that are better for me	Have more energy	Feel happier or more satisfied with my life	Have something to look forward to each day	Know where to ask if I need a service such as a ride to a doctor or an aide	Feel more able to stay independent	Feel that the senior center has had a positive effect on my life	Learn new things	Have learned about services and benefits	Am more physically active	Would recommend the senior center to a friend or family member	Please tell us how participating in the senior center has changed your life	I participate in the following activities at the senior center	Race - American Indian or Alaska Native	Race - Asian, Asian-American	Race - Black, African-American, Other African	Race - Hawaiian Native or Pacific Islander	Race - Hispanic, Latino	Race - Other	Race - White or Caucasian	Race	What is your zip code	Other (please specify)	What is your estimated annual income	Extra

# change survey ui h5 question size
# 