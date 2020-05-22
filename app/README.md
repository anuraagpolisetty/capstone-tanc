# ADS Dashboard app folder
This folder holds all the source code for creating the ADS Dashboard, which is published 
[here](https://adscenters.shinyapps.io/dashboard/)


## Structure
Each sub folder contains files that build different parts of the dashboard. 
* **Home** - home page that shows list of all senior center
* **Single_Center** - each senior centers "View Data" page
* **Compare** - Comparing Centers tab that analyzes differences between each center
* **Survey** - Creates the tab for survey questions and also files for storing the responses in Google Sheets 
* **Scripts** - Holds code for making graphs and data visualizations
* **www** - holds files for when publishing the app to a web page, including pictures, CSS style sheets, and documentation
* **data** - holds all the data we have from previous survey responses, senior centers, and demographics

The files **server.R** and **ui.R** contains the code for compiling all these source files into a single app and builds the actual user interface (ui) and handles the backend data calculations (server).

## Getting the information
To get the files on to your computer, you need to clone our repository. Here is a good step-by-step process of how to get this loaded to your desktop:

* https://help.github.com/en/desktop/contributing-to-projects/cloning-a-repository-from-github-to-github-desktop
* 

## Downloading RStudio
If you decide to add or remove any Senior Centers, you will need to download RStudio. Go [here](https://rstudio.com/products/rstudio/download/) and download the free version. This is where you can easily open up R files.

## Adding/changing information
### Smaller Changes (Minimal Coding Experience)
If you would like to change or update any information, such as adding a new senior center, adding new survey questions, or changing the income brackets, you need to edit the **constants.R** file. Open this file in RStudio or a similar code editor and see instructions within the file as to how to make these changes. 

### Bigger Changes (More coding experience needed)
If you would like to change more specific elements such as the layout of UI elements, please contact one of the developers before proceeding. If you feel that you have enough knowledge of R or CSS, you can make changes in the **style.css** file in the "*www*" folder.

## Republishing the App
When a change is made in the **constants.R** file, the page will need to be re-deployed before the changes will be reflected. To do this you _must_ open the either the **server.R** or **ui.R** in RStudio. Here are the steps needed to re-publish the application.

Follow along this Youtube video to help with the deployment process: https://www.youtube.com/watch?v=ZKWLfW4zBYs

or use this video to follow along with my video of making a change to a center here: https://www.youtube.com/watch?v=oCdbAPjAEz8

1. In the top right corner of these files, there should be a round bluish icon. When you click on the arrow to its right, the click the Publish Application button. 
2. It will then prompt you to install the required packages needed to publish. Click Yes.
3. Next a Publish to Server pop up will appear. Here you will click the Add New Account link in the top right part of the screen.
4. Pick the ShinyApps.io
5. Now we must get the secret key to plug into the text box. Here you can follow the steps below, or try the already generated key here (rsconnect::setAccountInfo(name='adscenters',
			  token='7557947F76FE11F9A4ED09991C85B528',
			  secret='4am+/2rBfNN1r/pXDgHAjsEsGTn0eUCA9M5NPkv9')): 
    + Log into shinyapps.io
    + Login: adscenterdata@gmail.com
    + Password: Kingcounty1
    + Click the accounts image icon in the top right corner and select Tokens
    + Click the Show button and then the Show Secret button
    + Copy and paste the _entire_ rsconnect function into the text box given on the RStudio and click Connect Account
    + Click on the newly added account and press publish.
  







