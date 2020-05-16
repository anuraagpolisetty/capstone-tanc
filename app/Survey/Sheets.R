library(googledrive)
library(googlesheets4)
library(dplyr)

# Root folder for storing all files:
# Title: ADS Survey Responses
# adsCenterData@gmail.com
# Password: Kingcounty1

folder_url="https://drive.google.com/drive/folders/1VrhYtDr3awzLxH5HVkCz3pqXGZaxP8uj"

folder_id <- "1VrhYtDr3awzLxH5HVkCz3pqXGZaxP8uj"
folder <- drive_get(folder_url)
folder_name <- folder$name
test <- drive_ls(path = "ADS Survey Responses")
drive_ls(folder_url)
drive_ls("ADS Survey Responses")

file_names <-drive_ls("ADS Survey Responses", q= "not name contains \'total\'", type="spreadsheet")$name
total <-drive_ls("ADS Survey Responses", q= " name contains \'total\'", type="spreadsheet")



# Create google Sheets for each center if it doesn't exist yet
update_center_ids <- function() {
  for(center in centers) {
    id <- drive_get(center)$id
    
    # if no sheet is found, create a new Google Sheet and store in drive
    if (length(id) == 0) {
        sheet <- gs4_create(center)
        drive_mv(file = sheet, path = as_id(folder))
        
        # get center Id of sheet and add to center_ids data frame
        new_center_id <- drive_get(center)$id
        center_ids[nrow(center_ids) + 1,] = list(center, new_center_id) 
    }
    
    
  }
}

# ((drive_get("ACRS")$id))
# mkGoogleSheets()
# length(drive_get("ACRS"))


# ids <- vector()
# for (i in centers) {
#   center <- drive_get(i)
#   center_id <- unclass(as_sheets_id(center))
#   ids[i] <- center_id
# }
# center_ids <- data.frame(center=centers, id=ids)
# 
# center_ids["ACRS","id"]
# 
# center_ids %>% select(center)



# auth code: 4/zwFqGrQ4zNoypjD1CPHOToq4sy2R5Z33lsDCTNIoM8NA_yJC6hqjmhc

#
# # Add column names to google sheet
# saveData <- function(data) {
#   df <- data.frame(matrix(unlist(data), ncol=length(data)), stringsAsFactors=FALSE)
#   print(df)
#   print(typeof(df))
  # center_name <- data[1, "which_center"]
  # ss <- drive_get(paste0(folder, "/", center_name))
  #
  # sheet_append(ss$id, df)
# }
#
#
#

