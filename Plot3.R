
###Assignment Week 1 for the Exploratory Data Analysis Module: PLOT 3###

#please set your working directory to the folder on your computer that contains the household_power_consumption.txt file. 
#for me this is: setwd("C:/Users/Kimberley/Documents/DATASCIENCE/Module4-ExploratoryDataAnalysis/AssignmentWeek1/ExData_Plotting1")
#you can also find the household_power_consumption.txt file I used on my git hub: https://github.com/knwallaart/ExData_Plotting1

#My system language is Dutch so I need to set this to English otherwise it parses the x-axis ticks in dutch
Sys.setlocale("LC_ALL","English")
Sys.setenv(LANG="en_US.UTF-8")

#download the necessary rows of the dataframe and the header for colnames
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", skip=66636,nrows=2880)
titles <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",nrows=1)
names(df) <- names(titles)
rm(titles)

#change the Date and Time column to "Date" and "POSIXlt" "POSIXt" class
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- as.character(df$Time)
df$Time <- paste(df$Date, df$Time, sep = " ")
df$Time <- strptime(df$Time, format = "%Y-%m-%d %H:%M:%S")

#Make Plot 3:
plot(df$Time,df$Sub_metering_1, type ="n", ylab = "Energy sub metering", xlab = "")
lines(df$Time,df$Sub_metering_1, col = "black")
lines(df$Time,df$Sub_metering_2, col = "red")
lines(df$Time,df$Sub_metering_3, col = "blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),
        cex = 0.9, ncol = 1,lwd=1,y.intersp = 1, text.font = 1)

#Save plot as png file:
dev.copy(png, file = "Plot3.png", width = 480, height = 480, units = "px")
dev.off()
