#load library
library(lubridate)

#reading subset dataset
df_subset <- read.csv("data_subset.csv")
df_subset$date_form <- ymd_hms(df_subset$date_form)

#plot 2 
par(mfrow=c(1,1))
with(df_subset, plot(date_form,Global_active_power, type="l",
                     ylab = "Global Activate Power (kilowatts)",
                     xlab=""))

#copy plot to png file
dev.copy(png,file="plot2.png")
dev.off()
