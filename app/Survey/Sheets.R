library(googlesheets4)
library(googledrive)
library(dplyr)
# gs4_auth()

ss <- "1mTXkR7OQya5hJoq3EC6N1TwkHuS8cRpHPDLd_VGF9Nk"
ss2 <- "1-EGzAaimDlkctFMNBKgle2dSFSh5vGX8jl6zJIehmfE"

sheets_auth(
  email = gargle::gargle_oauth_email(),
  path = NULL,
  scopes = "https://www.googleapis.com/auth/spreadsheets",
  cache = gargle::gargle_oauth_cache(),
  use_oob = gargle::gargle_oob_default(),
  token = NULL
)

sheet<- read_sheet("1mTXkR7OQya5hJoq3EC6N1TwkHuS8cRpHPDLd_VGF9Nk")

sheet2 <- read_sheet(ss2)
sheet2[1,]

ss <- sheet_write(ss)

ss %>% sheet_append(sheet2[1,])

gs4_has_token()

gs4_example("chicken-sheet")
sheets_browse(ss)
sheets_example("chicken-sheet")
