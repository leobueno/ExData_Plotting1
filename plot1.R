#Load data
source("setup.R")

# Plot 1
# It's an histogram of Global Active Power
# y = Frequency
# x = Global Active Power (kilowatts)
# color of histogram bars is red
plot1 <- function(data) {
  with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
}

plotExercise(
  function() plot1(data),
  "plot1.png"
)