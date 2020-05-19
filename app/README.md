# ADS Dashboard app folder
This folder holds all the source code for creating the ADS Dashboard, which is published 
[here](https://anuraagpolisetty.shinyapps.io/SurveyVisualizationDashboard)


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

## Adding/changing information

If you would like to change or update any information, such as adding a new senior center, adding new survey questions, or changing the income brackets, you need to edit the **constants.R** file. Open this file in RStudio or a similar code editor and see instructions within the file as to how to make these changes. 

If you would like to change more specific elements such as the layout of UI elements, please contact one of the developers before proceeding. If you feel that you have enough knowledge of R or CSS, you can make changes in the **style.css** file in the "*www*" folder.

## Republishing the App
