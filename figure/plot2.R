path_2_directory <- "/home/path" # Write here the path where you have 
# the file "household_power_consumption.txt"
setwd(path_2_directory)

library(lubridate)

energy <- read.table("household_power_consumption.txt",sep=";",
                     stringsAsFactors = FALSE)

le <- length(energy[,1])
names <- energy[1,]
names_list <-as.list(names)
names2 <- sapply(names_list,function(y) as.character(y[[1]]))

# Changing the names of columns so it is easier to read 

energy <- energy[2:le,]
colnames(energy) <- names2

date <- paste(energy$Date,energy$Time)
date <- dmy_hms(date)

# Find the period to plot 

d1 <- ymd("2007/2/1")
d2 <- ymd("2007/2/3")

ind <- which(date>=d1 & date<d2)
date2 <- date[ind]

# Data frame used in the following to create the plot

energy2 <-cbind(date2,energy[ind,3:9])

# Now the figure

png(file="plot2.png",height=480,width=480,units = "px")
plot(energy2$date2,energy2$Global_active_power,type="l",col="black",
     lty=1,lwd=1,ylab = "Global Active Power (kilowatts)",xlab=" ")
dev.off()
