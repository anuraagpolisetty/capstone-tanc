library("googledrive")
library("googlesheets4") # I am using the developing version 0.2.0
library("shiny")

# Root folder for storing all files:
# Title: "ADS Survey Responses"
# adsCenterData@gmail.com
# Password: Kingcounty1

# You want to deploy an app in Shinyapps.io or other server
# FIRST STEP----
# Get the token an store it in a cache folder embedded in your app directory
# designate project-specific cache
# options(gargle_oauth_cache = ".secrets")
options(gargle_quiet = FALSE) # So you can know what is happening
# Authenticate in interactive mode (run the app) ONCE and check if the token 
# has been stored inside the .secrets folder, after that just comment this line
# drive_auth() # Authenticate to produce the token in the cache folder (comment after generating)
# Grant permission to googlesheets to access to the token produced
# gs4_auth(token = drive_token()) #(comment after authenticated)

# SECOND STEP----
# Comment lines 10, 13 and 15 and uncomment lines 21 and 22
# You tell gargle to search the token in the secrets folder and to look
# for an auth given to a certain email (enter your email linked to googledrive!)
drive_auth(cache = ".secrets", email = "adscenterdata@gmail.com")
# drive_auth(cache = ".secrets", email = TRUE) # Use only if EXACTLY 1 email is preauthorized
gs4_auth(token = drive_token())

# test
# drive_ls()


# THIRD STEP---
# Now you can deploy your app in shinyapps.io!!
# Test if your app runs properly in the local version
# Authenticate in ShinyApps.io
# rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")
# setwd() in your App directory
# library(rsconnect)
# deployApp()
# Enjoy your new App!!

# options(
#   gargle_oauth_cache = ".secrets",
#   gargle_oauth_email = TRUE
# )



