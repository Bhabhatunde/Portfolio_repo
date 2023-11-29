install.packages('lubridate')
# Loading Packages
library(nycflights13)
library(tidyverse)
# Exploring datasets
glimpse(flights)
View(flights)
names(flights)
summary(flights)
df %>%summarise(mean(distance))
df %>%summarise(median(distance))
df %>%summarise(min(distance))
df %>%summarise(max(distance))
# Data Cleaning
df<- flights %>% 
  mutate(flight_date = ymd_hm(paste(year,month,day,hour,minute))) %>%
  select(origin, dest, flight_date) %>% head(4)
View(df)
        
df<- flights %>% 
  select(air_time, distance, origin, dest)
  View(df)
  
# Data Cleaning
 z <- df %>% select(air_time,distance) %>% 
   drop_na()
View(z) 

plot(z$distance,z$air_time)
#Linear regression model of distance and air time
modelz <- lm(z$air_time~z$distance)
abline(modz, col=10, lwd=2)
summary(modelz)
# Predicting the air time 
dist=c(5000, 5500, 6000, 6500, 7000)
test <- data.frame(dist)
prep <- predict(modelz, test) %>% round(1)
View(prep)

# There is a positive correlation between the air time and the distance between airports.
#Air_time
#Amount of time spent in the air, in minutes and Distance between airports, in miles.
cor.test(z$distance,z$air_time)





