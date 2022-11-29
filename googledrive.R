############ Download and check water stress data ##########
### 2022-11-21 algarsal
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
### Be sure of opening your project before the scrip.
### First time run the script step by step to create the 
### Oauth token for your Google account. 

w <- # adress of the spreadsheet
  "https://docs.google.com/spreadsheets/d/1WM6hDgwCFxbLpT37HLzU-iYZAEGBdHP6CpU8BDwWmZc/"
p <- # path to the data
  'data/wstress.xlsx' 

### Create data folder if needed
if (!dir.exists('data')) dir.create('data')

### download file using 'googledrive' ---------------------
# You need a Google account: user and password.
# A web page will open the first time
# where you have to enter your Google credentials
# and accept permissions. 
library(googledrive)
mydata <- drive_download(file = as_id(w), path = 'data/wstress.xlsx', 
               overwrite = TRUE) 
drive_deauth()

### Other option: download through web page --------------
# Go to the page: https://docs.google.com/spreadsheets/d/1WM6hDgwCFxbLpT37HLzU-iYZAEGBdHP6CpU8BDwWmZc/
# Press 'Archivo' (Files).
# Select 'Descargas' (Download) and 'Microsoft Excel (.xlsx)'
# Move the file into the 'data' folder in your project.



