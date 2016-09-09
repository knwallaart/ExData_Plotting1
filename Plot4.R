
###Assignment Week 1 for the Exploratory Data Analysis Module: PLOT 4###

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

#Make Plot 4:
#set par
par(mfcol=c(2,2))

#plot for row 1, col 1
plot(df$Time,df$Global_active_power, type ="n", ylab = "Global Active Power", xlab = "")
lines(df$Time,df$Global_active_power)

#plot for row 2, col 1
plot(df$Time,df$Sub_metering_1, type ="n", ylab = "Energy sub metering", xlab = "")
lines(df$Time,df$Sub_metering_1, col = "black")
lines(df$Time,df$Sub_metering_2, col = "red")
lines(df$Time,df$Sub_metering_3, col = "blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),
       cex = 0.9, ncol = 1,lwd=1,y.intersp = 0.8, text.font = 1, bty = "n")

#plot for row 1, col 2
plot(df$Time,df$Voltage, type ="n", ylab = "Voltage", xlab = "datetime")
lines(df$Time,df$Voltage)

#plot for row 2, col 2
plot(df$Time,df$Global_reactive_power, type ="n", xlab = "datetime", ylab = "Global_reactive_power")
lines(df$Time,df$Global_reactive_power)

#Save plots as png file:
dev.copy(png, file = "Plot4.png", width = 480, height = 480, units = "px")
dev.off()