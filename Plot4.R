# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# assume data is already in ./data folder

# Full project presentation located at:
# https://bitinsky.github.io/Exploratory_Data_Analysis/course-project-2.html
# https://github.com/bitinsky/Exploratory_Data_Analysis

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

sources <- SCC %>% 
  filter(grepl("coal", EI.Sector, ignore.case = TRUE)) %>% 
  select(SCC, EI.Sector)

png("Plot4.png")
NEI %>% 
  filter(SCC %in% sources$SCC) %>% 
  group_by(year, type) %>% 
  summarize(Emissions = sum(Emissions)/1000) %>%
  ggplot(aes(year, Emissions, col = type)) +
  geom_point() +
  geom_line() +
  ggtitle("USA PM2.5 Emissions by Year", subtitle = "From Coal-Combustion Sources") + 
  ylab("PM2.5 Emissions (kiloton)") + 
  xlab("Year")
dev.off()