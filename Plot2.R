
###Assignment Week 1 for the Exploratory Data Analysis Module: PLOT 2###

#please set your working directory to the folder on your computer that contains the household_power_consumption.txt file. 
#for me this is: setwd("C:/Users/Kimberley/Documents/DATASCIENCE/Module4-ExploratoryDataAnalysis/AssignmentWeek1/ExData_Plotting1")

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

#The system on the computer I use is set to Dutch so it gives me the weekdays in Dutch (do = Thu, vr = Fri, za = Sat)
#therefore the premade png of plot 2 that is in my git hub account has do, vr, za as axis labels
#instead of Thu, Fri, Sat...If you generate and save the plot from my code yourself
#(and have your system language set to English) you should get the correct plot. 

#Make Plot 2:
plot(df$Time,df$Global_active_power, type ="n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(df$Time,df$Global_active_power)

#Save plot as png file:
dev.copy(png, file = "Plot2.png", width = 480, height = 480, units = "px")
dev.off()

