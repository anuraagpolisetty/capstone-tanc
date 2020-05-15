library("googledrive")
library("googlesheets4") # I am using the developing version 0.1.0.9000
library("shiny")

# You want to deploy an app in Shinyapps.io or other server
# FIRST STEP----
# Get the token an store it in a cache folder embedded in your app directory
# designate project-specific cache
options(gargle_oauth_cache = ".secrets")
# options(gargle_quiet = FALSE) # So you can know what is happening
# Authenticate in interactive mode (run the app) ONCE and check if the token 
# has been stored inside the .secrets folder, after that just comment this line
drive_auth() # Authenticate to produce the token in the cache folder
# Grant permission to googlesheets to access to the token produced
gs4_auth(token = drive_token())

# SECOND STEP----
# Comment lines 10, 13 and 15 and uncomment lines 21 and 22
# You tell gargle to search the token in the secrets folder and to look
# for an auth given to a certain email (enter your email linked to googledrive!)
drive_auth(cache = ".secrets", email = "enter_your_email@here")
sheets_auth(token = drive_token())

# THIRD STEP---
# Now you can deploy your app in shinyapps.io!!
# Test if your app runs properly in the local version
# Authenticate in ShinyApps.io
# rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")
# setwd() in your App directory
# library(rsconnect)
# deployApp()
# Enjoy your new App!!



# library(googledrive)
# library(googlesheets4)
# library(googleAuthR)
# library(httr)
# library(shiny)


options(gargle_oauth_cache = ".secrets")
options(gargle_quiet = FALSE)

gs4_auth()


# file.remove('.httr-oauth')
# options(httr_oob_default=TRUE) 
# 
# gs4_deauth()
# ss <- "1KR37m3GOSVplXXBYkgqdP6YytE-ZAFQCyNLcJV4vrsA"
# read_sheet(ss)
# 
# oauth2.0_token(
#   endpoint = oauth_endpoints("google"),
#   app = oauth_app(
#     "google", 
#     key = getOption("googlesheets4.client_id"),
#     secret = getOption("googlesheets4.client_secret")
#   ),
#   scope = c(
#     "https://spreadsheets.google.com/feeds", 
#     "https://www.googleapis.com/auth/drive"),
#   use_oob = TRUE,
#   cache = TRUE
# )
# 
# gs_ls() # Test

# drive_auth(path = "auth/ads-center-dashboard-key2.json")
# 
# # # Stores the location of the drive folder
# folders <- drive_get("ADS Survey Responses")
# drive_ls("ADS Survey Responses")
