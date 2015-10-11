#Load data
source("setup.R")

# Plot 2
# It's a line plot with no title
# y = Global Active Power (kilowatts) / 0 - 6 by 2
# x = time / Thu - Fri - Sat
# Line uses the default color, black
plot2 <- function(data) {
  with(data, plot(DateTime, Global_active_power, type="l", main = "", ylab = "Global Active Power (kilowatts)", xlab=""))
}

plotExercise(
  function() plot2(data),
  "plot2.png"
)