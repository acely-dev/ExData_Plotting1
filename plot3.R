#load library
library(lubridate)

#reading subset dataset
df_subset <- read.csv("data_subset.csv")
df_subset$date_form <- ymd_hms(df_subset$date_form)

#plot 3
par(mfrow=c(1,1))
with(df_subset, plot(date_form,Sub_metering_1, type="l", xlab = "", 
     ylab="Energy sub metering"), type="n")
with(df_subset, points(date_form,Sub_metering_2, type = "l", col="red"))
with(df_subset, points(date_form,Sub_metering_3, type = "l", col="blue"))
legend("topright", lty = 1, cex=0.8 ,col=c("black","blue","red"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#copy plot to png file
dev.copy(png,file="plot3.png")
dev.off()
