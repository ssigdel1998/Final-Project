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


library(dplyr)
library(tidyr)
library(purrr)
require(ggplot2)
mydata <- iris
ggplot(iris, aes(, )) + geom_boxplot(aes(color=spray, fill=spray))


ggplot(iris) + geom_bar(aes(x=Petal.Length, color=Species))

ggplot(data = iris) +
  geom_bar
#######################################
calculate <- function(x, y) {
  count <- tapply(x, y, length)
  mean1 <- tapply(x, y, mean)
  SD <- tapply(x, y, sd)
  SE <- SD / sqrt(length(count))
  return=data.frame(SE, SD, mean1, count)
}  
########################################
myp <- calculate(iris$Petal.Length, iris$Species)

a <- iris %>%
  group_by(Species) %>%
  summarise( 
    n=n(),
    mmean=mean(Sepal.Length),
    sd=sd(Sepal.Length)
  ) %>%
  mutate( se=sd/sqrt(n))  %>%
  mutate( ic=se * qt((1-0.05)/2 + .5, n-1))

plot(Sepal.Length~Species, data = iris)


######################################

a <- iris %>% 
  group_by(Species)

###########################################################33
a <- iris %>% 
  group_by(Species) %>% 
  summarise(Mean.Petal.Length = mean(Petal.Length),
            n.Petals = length(Petal.Length),
            sd.Petal.Length = sd(Petal.Length),
            SE.Petal.Length = sd(Petal.Length) / sqrt(length(Petal.Length)))


ggplot(data =a) +
  geom_bar(
    mapping = aes(x=Species, y=mmean, fill=Species), stat = "identity",
    width = 0.2 ) +
  geom_errorbar(aes(x=Species, ymin=mmean-se, ymax=mmean+se), width=0.1, colour="orange", alpha=0.9, size=1.5) +
  ggtitle("using standard error")   






