# library(googledrive)
# library(googlesheets4)
# library(dplyr)
# 
# # Only run this section once
# 
# # Initialize google drive authentication
# drive_auth(
#   email = gargle::gargle_oauth_email(), # use gargle to automatically sign in to your email
#   path = NULL,
#   scopes = "https://www.googleapis.com/auth/drive",
#   cache = gargle::gargle_oauth_cache(),
#   use_oob = gargle::gargle_oob_default(),
#   token = NULL
# )
# 
# #Initialize Google Sheets authentication
# gs4_auth(token = drive_token())
# 
# 
# # Create inital drive folder
# # folder <- drive_mkdir("ADS Survey Responses")
# 
# # Stores the location of the drive folder
# folder <- drive_get("ADS Survey Responses")
# 
# 
# centers <- c("ACRS", "Ballard", "Greenwood", "IDIC", "PMSC", "Sunshine Garden", 
#              "Wallingford", "West Seattle", "CISC", "South Park", "GWP", "Southeast")
# 
# ss_centers <- centers
# batches <- c("2016-1", "2016-2", "2017-1", "2017-2", "2018-1", "2018-2",
#              "2019-1", "2019-2", "2020-1", "2020-2")
# 
# # Create google Sheets for each center (only once)
#   # for(c in centers) {
#   #   sheet <- gs4_create(c)
#   #   drive_mv(file = sheet, path = as_id(folder))
#   # 
#   # }
#   # drive_ls(folder)
# 
# # Store all Spreadsheet IDs
# # ss_ACRS <- drive_get(paste0(folder, "/ACRS"))
# # ss_Ballard <- drive_get(paste0(folder, "/Ballard"))
# # ss_Greenwood <- drive_get(paste0(folder, "/Greenwood"))
# # ss_IDIC <- drive_get(paste0(folder, "/IDIC"))
# # ss_PMSC <- drive_get(paste0(folder, "/PMSC"))
# # ss_SG <- drive_get(paste0(folder, "/Sunshine Garden"))
# # ss_Wallingford <- drive_get(paste0(folder, "/Wallingford"))
# # ss_WestSeattle <- drive_get(paste0(folder, "/West Seattle"))
# # ss_CISC <- drive_get(paste0(folder, "/CISC"))
# # ss_SouthPark <- drive_get(paste0(folder, "/South Park"))
# # ss_GWP <- drive_get(paste0(folder, "/GWP"))
# # ss_Southeast <- drive_get(paste0(folder, "/Southeast"))
# # 
# # ss_ACRS %>% sheet_append()
# 
# # Add column names to google sheet
# saveData <- function(data) {
#   df <- data.frame(matrix(unlist(data), ncol=length(data)), stringsAsFactors=FALSE)
#   print(df)
#   print(typeof(df))
#   # center_name <- data[1, "which_center"]
#   # ss <- drive_get(paste0(folder, "/", center_name))
#   # 
#   # sheet_append(ss$id, df)
# }
# 
# 
# 

