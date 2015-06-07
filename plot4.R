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


## Create the plot file

png(filename="plot4.png", width = 480, height = 480)

## Set the parameters for a canvas of 4 plots by (cols, rows)

par(mfcol = c(2,2))

## Plot Date_Time with Global_active_power on (column 1, row 1)

plot(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
      ,pwr_consumption$Global_active_power
      ,type="l"
      ,xlab=""
      ,ylab="Global Active Power"
    )

## Plot Date_Time with Sub_meterings on (column 1, row 2)

plot(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
     ,pwr_consumption$Sub_metering_1
     ,type="l"
     ,xlab=""
     ,ylab="Energy sub metering"
    )
     
lines(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
           ,pwr_consumption$Sub_metering_2
           ,col = "red"
      )

lines(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
      ,pwr_consumption$Sub_metering_3
      ,col = "blue"
      )

legend("topright"
       ,bty = "n"
       ,col = c("black", "red", "blue")
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lwd = 1
       ,cex = 0.75
      )


## Plot Date_Time with Voltage on (column 2, row 1)

plot(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
     ,pwr_consumption$Voltage
     ,type="l"
     ,xlab="datetime"
     ,ylab="Voltage"
)

## Plot Date_Time with Global_reactive_power on (column 2, row 2)

plot(strptime(paste(pwr_consumption$Date, pwr_consumption$Time), "%d/%m/%Y %H:%M:%S")
     ,pwr_consumption$Global_reactive_power
     ,type="l"
     ,xlab="datetime"
     ,ylab="Voltage"
)

dev.off()
