# Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? Using the base plotting system, make a plot showing the total 
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, 
# and 2008?

# assume data is already in data/ folder

# Full project presentation located at:
# https://bitinsky.github.io/Exploratory_Data_Analysis/course-project-2.html
# https://github.com/bitinsky/Exploratory_Data_Analysis

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)

png("Plot1.png")
plot(NEI %>% group_by(year) %>% summarize(sum(Emissions)/1000),
          type = "b", 
          col = "red", 
          main = ("Total USA PM2.5 Emissions by Year"), 
          ylab = ("PM2.5 Emissions (kilotons)"), 
          xlab = "Year")
dev.off()
