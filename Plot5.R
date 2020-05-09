# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

# assume data is already in ./data folder

# Full project presentation located at:
# https://bitinsky.github.io/Exploratory_Data_Analysis/course-project-2.html
# https://github.com/bitinsky/Exploratory_Data_Analysis

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

sources <- SCC %>% 
  filter(grepl("vehicle", EI.Sector, ignore.case = TRUE)) %>% 
  select(SCC, EI.Sector)

png("Plot5.png")
NEI %>% 
  filter(SCC %in% sources$SCC, fips == 24510) %>% 
  group_by(year, type) %>% 
  summarize(Emissions = sum(Emissions)) %>%
  ggplot(aes(year, Emissions, col = type)) +
  geom_point() +
  geom_line() +
  ggtitle("Baltimore PM2.5 Emissions by Year", subtitle = "From Vehicular Sources") + 
  ylab("PM2.5 Emissions (ton)") + 
  xlab("Year")
dev.off()