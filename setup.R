usePackage <- function(p) {
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE)
  require(p, character.only = TRUE)
}

# This is a reusable function to generate the plot and save as a png
# exercPlotFunc: It's a function that generates the exercise plot
# filename: Filename to use when saving the plot to png
plotExercise <- function(exercPlotFunc, filename) {
  png(file=filename,width=480,height=480)
  exercPlotFunc()
  dev.off()    
}

#Set locale for displaying date info to English, so in the graphs Thu, Fri and Sat are used as labels
Sys.setlocale("LC_TIME", "English")

usePackage("downloader")

# Download the dataset if we can't find it in the current dir
if (!file.exists("household_power_consumption.txt")) {
  download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="household_power_consumption.zip", mode="wb")
  unzip ("power_consumption.zip")
}

if (file.exists("data.rds")) {
  data <- readRDS("data.rds")
} else {
  # Loading the data
  # the full dataset is 13MB, it's a bit slow to load, but shouldn't cause any errors loading
  data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  # filter only the days we need for our analysis
  data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]
  # Create a column with a POSIXlt object representing the date and time of the observation
  data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
  saveRDS(data, "data.rds")
}