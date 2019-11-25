install.packages("jsonlite")
library(jsonlite)
install.packages("httpuv")
library(httpuv)
install.packages("httr")
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on what you 
myapp <- oauth_app(appname = "Access_GitHub",
                   key = "b5f9acfe8f713d2b3186",
                   secret = "1dbe07c8a633065e643cff3088f2059d6cd767ff")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/ebroderi/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "ebroderi/datasharing", "created_at"] 


#get data from my github
myData=fromJSON("https://api.github.com/users/ebroderi")
myData$followers # number of followers
#get followers
followers=fromJSON("https://api.github.com/users/ebroderi/followers")
followers$login #usernames of followers
myData$following #how many users I follow

following=fromJSON("https://api.github.com/users/ebroderi/following")
following$login #usernames of people I follow

myData$public_repos #number of repositories
repos = fromJSON("https://api://api.github.com/users/ebroderi/repos")
repos$name #details of names of repositories
repos$created_at #date of creation of repositories
repos$full_name #names of repositories

myData$bio #Display bio 


#Part 2 
myData = GET("https://api.github.com/users/andrew/followers?per_page=100;", gtoken)
stop_for_status(myData)
extract = content(myData)
#converts into dataframe
githubDB = jsonlite::fromJSON(jsonlite::toJSON(extract))
githubDB$login

