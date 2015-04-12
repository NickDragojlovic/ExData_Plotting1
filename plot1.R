## download and read data

url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp <- tempfile()

download.file(url, temp, method="curl", quiet=TRUE)

unzipped <- unz(temp, "household_power_consumption.txt")

data <- read.table(unzipped, header = TRUE, sep = ";", na.strings = "?")

unlink(temp)

## Check if dplyr package has been downloaded by user. If not, download package. Load dplyr.

if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}

library(dplyr)

## Subset & recode dataset

data$Date <- as.Date(data$Date, "%d/%m/%Y")

mydata <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

## write histogram to PNG graphics file device

png(file="plot1.png")

hist(mydata$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     main="Global Active Power",
     col="red"
     )

dev.off()