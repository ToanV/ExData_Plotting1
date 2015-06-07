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


## Create the plot for Global_active_power

png(filename="plot1.png", width = 480, height = 480)
hist(pwr_consumption$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
