# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

# assume data is already in data/ folder

# Full project presentation located at:
# https://bitinsky.github.io/Exploratory_Data_Analysis/course-project-2.html
# https://github.com/bitinsky/Exploratory_Data_Analysis

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(dplyr)

png("Plot2.png")
plot(NEI %>% 
       filter(fips == 24510) %>% 
       group_by(year) %>% 
       summarize(sum(Emissions)/1000),
     type = "b", 
     col = "red", 
     main = ("Baltimore PM2.5 Emissions by Year"), 
     ylab = ("PM2.5 Emissions (kilotons)"), 
     xlab = "Year")
dev.off()