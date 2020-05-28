##libraries
library(readr) 
library(lubridate)

#get dataset from url
url_data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url_data, method = "curl", destfile = "data.zip")
#load data from zip file
df = read_delim("data.zip",";", na = c("?", "NA"))
df["date_form"]<- dmy_hms(paste(df$Date,df$Time))
df["year_form"]<- year(df$date_form)
df["month_form"]<- month(df$date_form)
df["day_form"]<- day(df$date_form)
df_subset <- subset(df, year_form==2007 & month_form==2 &(day_form==1 |day_form==2))

#save subset to file
write.csv(df_subset,"data_subset.csv")

#plot 1 hist
par(mfrow=c(1,1))
hist(df_subset$Global_active_power, col="red", breaks=12, 
     main = "Global Activate Power", xlab="Global Activate Power (kilowatts)" )

#copy plot to png file
dev.copy(png,file="plot1.png")
dev.off()

