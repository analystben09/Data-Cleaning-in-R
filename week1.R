file.exists("directoryName") 
#will check to see if the directory exists

dir.create("directoryName")
#will create a directory if it doesn't exist

#here is an eg. checking for a "data" directory and creating it doesn't exist

if (!file.exists("data")) {
        dir.create("data")
}

#downloading data from internet

download.file()

#downloading a file from web

fileURL <- "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2020-financial-year-provisional/Download-data/annual-enterprise-survey-2020-financial-year-provisional-size-bands-csv.csv"
download.file(fileURL, destfile = 'C:/Users/ben/Documents/R/DataCleaning/data/enterprise.csv')
list.files("C:/Users/ben/Documents/R/DataCleaning/data")

dateDownloaded <- date()


#reading local files

enterpriseData <- read.table("./data/enterprise.csv", sep = ",", header = TRUE)

#or use

enterpriseData <- read.csv("./data/enterprise.csv")

head(enterpriseData)


#reading excel files

fileURL <- "https://file-examples-com.github.io/uploads/2017/02/file_example_XLSX_100.xlsx"
download.file(fileURL, destfile = 'C:/Users/ben/Documents/R/DataCleaning/data/exceltest.xlsx')
list.files("C:/Users/ben/Documents/R/DataCleaning/data")

library(xlsx)

excelData <- read.xlsx("./data/exceltest.xlsx", sheetIndex = 1, header = TRUE)
head(excelData)

excelDataSubset <- read.xlsx("./data/exceltest.xlsx", sheetIndex = 1, colIndex = 2:3,
                             rowIndex = 1:4)


#reading XML files

library(XML)
fileURL <- "https://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)
rootnode <- xmlRoot(doc)
xmlName(rootnode)

names(rootnode)

#directly access parts of the XML doc

rootnode[[1]]

rootnode[[1]][[1]]

#getting items on the menu and prices

xpathSApply(rootnode, "//name", xmlValue)

xpathSApply(rootnode, "//price", xmlValue)

#another example

fileURL <- "https://www.espn.in/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(sub("s", "", fileURL),useInternal = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='score']", xmlValue)

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)

#or

library(XML)
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(fileURL)
doc <- xmlParse(xData)


#reading a json file

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

jsonData$owner$login

myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)

#data.table package

library(data.table)
DF = data.frame(x = rnorm(9), y = rep(c("a", "b", "c")), each = 3, z = rnorm(9))
head(DF, 3)

#subsetting rows

DF[2,]

DF[DF$y=="a", ]

DF[,c(2,3)]

#calculating values for variables with expressions

DF[,list(mean(x)), sum(z)]

DF[,table(y)]

#adding new colns

DF[,w:=z^2]

