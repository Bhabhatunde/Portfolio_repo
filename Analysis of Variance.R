library(tidyverse)
View(msleep)
?msleep
?tidyverse
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(name == "Dog"| name == "Goat" | name == "Cow")
View(my_data)

# OR 
my_data <-  msleep %>% 
  select(sleep_total, sleep_rem, name) %>% 
  filter(name %in% c("Dog", "Goat", "Cow"))
View(my_data)

#Selecting missing values
my_data <- msleep %>% 
  select(name, conservation, sleep_total) %>% 
  filter(is.na(conservation))
View(my_data)

#Removing missing values
my_data <- msleep %>% 
  select(name, conservation, sleep_total) %>% 
  filter(!is.na(conservation))
View(my_data)

my_data <- msleep %>% 
  select(vore, sleep_total) %>% 
  drop_na()
View(my_data)

names(msleep)

my_data <- msleep %>% 
    select(vore, sleep_rem) %>% 
    drop_na()
View(my_data)

mod1 <- aov(sleep_rem ~ vore, data = my_data)
summary(mod1)

msleep %>% 
  select(vore, sleep_rem) %>% 
  drop_na() %>% 
  aov(sleep_rem ~ vore, data= .) %>% 
  summary()
