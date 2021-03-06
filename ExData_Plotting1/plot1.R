dir_BIGdata <- "C:/Users/Win/Documents/BIG data files/Data Sciences Course Data"
#be sure to extrat the file located in "dir_BIGdata" directory
setwd(dir_BIGdata)

#=======Reads the full power data set
library(data.table)
library(lubridate)
power_fulldata <- fread("household_power_consumption.txt",header = TRUE)
names(power_fulldata)
head(power_fulldata)
tail(power_fulldata)
str(power_fulldata)

#Date conversion
power_fulldata$Date <- dmy(power_fulldata$Date)

#========Creates tidy Data

#Extracting relevent dates: ymd 2007-02-01 to 2007-02-02
library(dplyr)

power_smalldata <- 
  subset(power_fulldata, 
         (Date >= ymd("2007-02-01") & 
            Date <= ymd("2007-02-02")))

rm(power_fulldata)

#create date time variable and week variable
date_time <- 
  data.table("Date_Time" = paste(power_smalldata$Date, 
                                 power_smalldata$Time, sep = " "))
date_time$Date_Time <- ymd_hms(date_time$Date_Time)

date_time <- mutate(date_time, week_d = 
                      wday(date_time$Date_Time, 
                           label = TRUE, abbr = TRUE))

#Convert to power_smalldata numeric
power_smalldata <- data.table(sapply(power_smalldata,as.numeric))
power_smalldata$Date = NULL
power_smalldata$Time = NULL

#Combine date_time and power_smalldata to create tidy data
power_tdata <- cbind(date_time,power_smalldata)
rm(date_time); rm(power_smalldata)

#======Writes tidy data to R Data Directory

dir <- "H:/5 Personal Projects/Coursera/Data Science Course/R Data/"
setwd(dir)
getwd

write.csv(power_tdata, "power_tdata.csv", 
          col.names = TRUE,
          row.names = FALSE)

################################################

#Household Power consumption project
#Make sure power_tdata is in directory
# if not then run the create it with "HH pwr create tidy data" 
dir <- "H:/5 Personal Projects/Coursera/Data Science Course/R Data/"
dir_plotsave <- "H:/5 Personal Projects/Coursera/Data Science Course/Projects/Household power consumption/"
setwd(dir)
getwd
library(dplyr)
library(data.table)
library(datasets)
library(lubridate)

#reads tidy data
power_tdata <- fread("power_tdata.csv", header = TRUE)
names(power_tdata)

#sets Date_Time as date
power_tdata$Date_Time <- ymd_hms(power_tdata$Date_Time)

#=========Performing Exploratory analysis

#Histogram of Global active power for 2007-02-01 to 2007-02-02
par(mar = c(5,5,4,2))
hist(power_tdata$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", ylim = c(0, 1200), col = "Red")

dir_plotsave <- "H:/5 Personal Projects/Coursera/Data Science Course/Projects/Household power consumption/"

setwd(dir_plotsave)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
dev.off(dev.list()["RStudioGD"])
setwd(dir)