
#editing text variables

fileURL <- "https://raw.githubusercontent.com/DataScienceSpecialization/courses/master/03_GettingData/04_01_editingTextVariables/data/cameras.csv"
download.file(fileURL, destfile = "./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

tolower(names(cameraData)) 
#forces uppercase into lowercase

splitNames <- strsplit(names(cameraData), "\\.") 
#splits variable names

splitNames[[6]]

mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)

mylist[1]
mylist$letters
mylist[[1]]


#fixing charachter vectors - sapply()

splitNames[[6]][1]

firstElement <- function(x) {x[1]}

sapply(splitNames, firstElement)


#fixing charachter vectors - sub()

reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

names(reviews)

sub("_", "", names(reviews), )


#fixing charachter vectors - gsub()

testName <- "this_is_a_test"

sub("_", "", testName)

gsub("_", "", testName)


#finsing values - grep(), grepl()

grep("Alameda", cameraData$intersection)

table(grepl("Alameda", cameraData$intersection))

cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection)]

grep("Alameda", cameraData$intersection, value = T)

grep("JeffStreet", cameraData$intersection)

length(grep("JeffStreet", cameraData$intersection))


#some more useful sting fuctions

library(stringr)

nchar("Jeffery Leek")

substr("Jeffery Leek", 1, 7)

paste("Jeffery", "Leek")

paste0("Jeffery", "Leek")

str_trim("     Jeff             ")


#regular expressions

^i think #represent start of the line

mornings$ #represent end of the line

[Bb][Uu][Ss][Hh] #will match all versions of the word "bush"

^[Ii] am #will match "I" or "i" from the beginning of the line

^[0-9][a-zA-Z] #will match any order of lines that specify this range

[^?.]$ #will match any line ending with other then "?" and "."

9.11 # "." will look for any character between 9 and 11 ; will return that

flood | fire | hurricane # "|" means "or" 

^[Gg]ood | [Bb]ad 

^([Gg]ood | [Bb]ad)

[Gg]eorge ([Ww]\.)? [Bb]ush
#In this we wanted to match a "." as a literal period; to do that we had to "escape" 
#the metacharachter, preceding it with a "\" will do just that.
#In general we have to this for any metacharachter we want to include.

(.*) 
# "*" and "+" signs are metacharachters used to indicate repetition;
# "*" means "any number, including none, of the item"
# "+" means "at least one of the item"

[0-9]+ (.*)[0-9]+
        
[Bb]ush ( +[^ ]+ +){1,5} debate 
#{ and } are referred to as interval quantifiers; it let us specify the minimum
#and maximum number of matches of an expression
#{m,n} means at least "m" but not more than "n" matches

 +([a-zA-Z]+) +\1 +
#\1 will repeat the ([a-zA-Z]+) again

^s(.*)s
#this will bring "s" beginning at a string and followed by large number of 
#charachters followed agai by "s"

^s(.*)s$
        

#working with data

d1 = date()    
d1
class(d1)        
        
d2 = Sys.Date()      
d2
class(d2)

format(d2, "%a %b %d")
#%d = day as number (0-31), %a == abbreviated weekday, %A = unabbreviated weekday,
#%m = month (00-12), %b = abbreviated month, %B = unabbreviated month, 
#%y = 2 digit year, %Y = four digit year


#creating dates

x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z = as.Date(x, "%d%b%Y")
z

z[1] - z[2]

as.numeric(z[1] - z[2])        
        

#converting to Julian

weekdays(d2)

months(d2)        
        
julian(d2)
        

#lubridate

library(lubridate)
ymd("20140108")
myd("08/04/2013")
dmy("03-04-2013")


ymd_hms("2011-08-03 10:15:03")

ymd_hms("2011-08-03 10:15:03", tz = "Pacific/Auckland")

x = dmy(c("1jan2013", "2jan2013", "31mar1960", "30jul1960"))

wday(x[1])

wday(x[1], label = T)
