
  
library(tidyverse)
library(tidytuesdayR)

freed_slaves <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-16/freed_slaves.csv')

freed_slaves<-mutate(freed_slaves, Free= paste(freed_slaves$Free, "%", sep=""))


g<-ggplot(freed_slaves, aes(Year, Slave))+
  geom_area(fill="black")+
  labs(title = ("PROPORTION OF FREEMAN AND SLAVES AMONG AMERICAN NEGROES . \n\n\n PROPORTION  DES  NÈGRES  LIBRES ET DES ESCLAVES EN AMÉRIQUE ."),
       subtitle = ("DONE BY ATLANTA UNIVERSITY ."))+
  geom_text(data=(subset(freed_slaves,freed_slaves$Year!=1870)) ,aes(y = Slave, label = Free, size = 12), vjust= -0.2, hjust=0.48, fontface="bold")+
  annotate("text", x = 1870, y = 91, label = "100%", size=4.3, fontface="bold", hjust=0.35)+
  coord_cartesian(clip = "off")+
  theme(panel.background = element_rect(fill = "#157645"),
        plot.background = element_rect(fill = "#d9cbbf"),
        panel.grid = element_blank(),
        axis.title=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.text.x=element_text(size=12, face="bold", colour="black"),
        panel.grid.major.x = element_line(size=0.1),
        legend.position="none",
        plot.margin= margin(4, 1.2, 0.3, 1.2, "cm"),
        plot.title = element_text(hjust = 0.5, vjust = 37, face="bold"),
        plot.subtitle = element_text(size=10,face="bold", hjust = 0.5, vjust = 35))+
  scale_x_continuous(limits = c(1790,1870), expand = c(0, 0), position="top", breaks = seq(1790, 1870, 10))+
  scale_y_continuous(limits=c(0, 120), expand = c(0, 0))+
  annotate("text", x = 1830, y = 112, label = "FREE  -  LIBRE", size=6, fontface="bold")+
  annotate("text", x = 1830, y = 50, label = "SLAVES \nESCLAVES", colour="#b2a9a1", size=7, fontface="bold")

g


ggsave(here::here("week8","gweek8.png"), width=7, height=10)

