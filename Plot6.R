# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes over 
# time in motor vehicle emissions?

# assume data is already in ./data folder

# Full project presentation located at:
# https://bitinsky.github.io/Exploratory_Data_Analysis/course-project-2.html
# https://github.com/bitinsky/Exploratory_Data_Analysis

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

png("Plot6.png")
NEI %>% 
  filter(fips %in% c("24510","06037"), type == "ON-ROAD") %>% 
  group_by(year, fips) %>% 
  summarize(Emissions = sum(Emissions)) %>%
  mutate(City = ifelse(fips == "06037","Los Angeles",
                       ifelse(fips == "24510", "Baltimore", "error"))) %>%
  ggplot(aes(year, Emissions, col = City)) +
  geom_point(aes(shape = City), size = 3) +
  geom_line() +
  ggtitle("Emissions From Motor Vehicle Sources by Year", 
          subtitle = "Comparing Baltimore to Los Angeles") + 
  ylab("PM2.5 Emissions (ton)") + 
  xlab("Year")
dev.off()