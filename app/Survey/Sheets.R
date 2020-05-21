library(googledrive)
library(googlesheets4)
# source("auth.R", local = T)

## Receives and uploads data from survey to Google Sheet corresponding to correct center

# Root folder for storing all files:
# Title: "ADS Survey Responses"
# adsCenterData@gmail.com
# Password: Kingcounty1

# if changing the location of ADS Survey Responses folder, paste url here:
folder_url="https://drive.google.com/drive/folders/1VrhYtDr3awzLxH5HVkCz3pqXGZaxP8uj"

drive_auth(cache = ".secrets", email = TRUE)
gs4_auth(token = drive_token())
total <- drive_get("total")
total_google_id <<- unclass(as_sheets_id(total))
total_data <- range_speedread(total_google_id)
final_data <<- data.frame(total_data)

folder_id <- "1VrhYtDr3awzLxH5HVkCz3pqXGZaxP8uj"
folder <- drive_get(folder_url)
folder_name <- folder$name
# test <- drive_ls(path = "ADS Survey Responses")
# drive_ls(folder_url)
# drive_ls("ADS Survey Responses")

# file_names <-drive_ls("ADS Survey Responses", q= "not name contains \'total\'", type="spreadsheet")$name
# total <-drive_ls("ADS Survey Responses", q= " name contains \'total\'", type="spreadsheet")

# saves data to specific center's google sheet
saveData <- function(data, columns) {
  df <- data.frame(matrix(unlist(data), ncol=length(data)), stringsAsFactors=FALSE)
  colnames(df) <- columns
  
  # Access center name and Google sheet id
  center_name <- df[1, "SiteID"]
  # id <- center_ids[center_name, "id"]
  
  drive_auth(cache = ".secrets", email = TRUE)
  gs4_auth(token = drive_token())
  
  id <- drive_get(center_name)$id
  # IF no sheet id is found, create a new google sheet (with column names)
  
  if(length(id) == 0) {
    id <- createNewSheet(center_name)
  }
  # if(is.na(id)) {
  #   id <- createNewSheet(center_name)
  # }

  # Finally, add df to the sheet id
  sheet_append(id, df)
  sheet_append(total_google_id, df)
  
}

# Creates a new google sheet and returns its id
createNewSheet <- function(center_name){
  print("Creating a new Google Sheet...")
  
  drive_auth(cache = ".secrets", email = TRUE)
  gs4_auth(token = drive_token())
  
  new_sheet <- gs4_create(center_name)
  drive_mv(file = new_sheet, path = as_id(folder_url))
  # Add row of column names
  column.names <- do.call(rbind.data.frame, list(all.columns))
  print(column.names)
  sheet_append(new_sheet, column.names)
  
  # # get center Id of new_sheet and add to center_ids data frame (in constants.R)
  # new_center_id <- new_sheet
  # center_ids[nrow(center_ids) + 1,] = list(center_name, new_center_id)
  
  new_sheet
}



# auth code: 4/zwFqGrQ4zNoypjD1CPHOToq4sy2R5Z33lsDCTNIoM8NA_yJC6hqjmhc


