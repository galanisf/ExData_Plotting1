#### plot3.R
#
#  Description: Global Active Power. 
#  Dataset : UCI Data -  Electric power consumption
#  Description: Code to display a histogram on Global Active Power

#### Read full dataset.
householdPC <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
householdPC$Date <- as.Date(householdPC$Date, format="%d/%m/%Y")

#### Subsetting data.
householdPCSubset <- subset(householdPC, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(householdPC)

#### Converting to date format
datetime <- paste(as.Date(householdPCSubset$Date), householdPCSubset$Time)
householdPCSubset$Datetime <- as.POSIXct(datetime)

#### Plot 3
with(householdPCSubset, 
     {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", 
             xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
     }
    )
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#### Saving to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
