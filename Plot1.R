
###Assignment Week 1 for the Exploratory Data Analysis Module: PLOT 1###

#please set your working directory to the folder on your computer that contains the household_power_consumption.txt file. 
#for me this is: setwd("C:/Users/Kimberley/Documents/DATASCIENCE/Module4-ExploratoryDataAnalysis/AssignmentWeek1/ExData_Plotting1")
#you can also find the household_power_consumption.txt file I used on my git hub: https://github.com/knwallaart/ExData_Plotting1

#download the necessary rows of the dataframe and the header for colnames
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", skip=66636,nrows=2880)
titles <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",nrows=1)
names(df) <- names(titles)

#change the Date and Time column to "Date" and "POSIXlt" "POSIXt" class
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- as.character(df$Time)
df$Time <- paste(df$Date, df$Time, sep = " ")
df$Time <- strptime(df$Time, format = "%Y-%m-%d %H:%M:%S")

#Make Plot 1:
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Save plot as png file:
dev.copy(png, file = "Plot1.png", width = 480, height = 480, units = "px")
dev.off()
