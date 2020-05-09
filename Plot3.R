# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? Which have 
# seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
# system to make a plot answer this question.

# assume data is already in ./data folder

# Full project presentation located at:
# https://bitinsky.github.io/Exploratory_Data_Analysis/course-project-2.html
# https://github.com/bitinsky/Exploratory_Data_Analysis

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

png("Plot3.png")
NEI %>% 
  filter(fips == 24510) %>% 
  group_by(year, type) %>% 
  summarize(Emissions = sum(Emissions)) %>%
  ggplot(aes(year, Emissions)) +
         geom_point() +
         geom_line() +
         facet_grid(. ~ type) +
         ggtitle("Baltimore PM2.5 Emissions", subtitle = "By Type and Year") + 
         ylab("PM2.5 Emissions (ton)") + 
         xlab("Year")
dev.off()