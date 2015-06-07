## Load and install the sqldf package

install.packages('sqldf')
library(sqldf)


## Set the working directory

setwd("C:/Coursera/EDA/Project/")


## USing the SQL method to load the large data file into pwr_consumption
## with filtered dates in ('1/2/2007', '2/2/2007')

pwr_consumption <- read.csv.sql("household_power_consumption.txt"
                                ,sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                                ,header = TRUE
                                ,sep = ";")
closeAllConnections()


## Create the plot for Date_Time by Sub_metering

png(filename="plot3.png", width = 480, height = 480)

## Plot Date_Time with Sub_metering_1

plot(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
      ,pwr_consumption$Sub_metering_1
      ,type="l"
      ,xlab=""
      ,ylab="Global Active Power (kilowatts)"
    )

## Plot Date_Time with Sub_metering_2 in RED

lines(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
      ,pwr_consumption$Sub_metering_2
      ,col = "red"
      )

## Plot Date_Time with Sub_metering_2 in BLUE

lines(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
      ,pwr_consumption$Sub_metering_3
      ,col = "blue"
    )

## Add legend to the top right corner of the plot

legend("topright"
       ,col = c("black", "red", "blue")
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lwd = 1
       )

dev.off()
