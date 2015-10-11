#Load functions plot2 and plot3 only if required
if(!exists("plot2", mode="function")) source("plot2.R")

if(!exists("plot3", mode="function")) source("plot3.R")

#Load setup only if not already loaded by previous invocations to source
if(!exists("plotExercise", mode="function")) source("setup.R")


# Plot 4
# 4 graphs on the same plot, arranged on a 2 x 2 grid
# Graphs used
# 0,0 -> From exercise #2 
# 0,1 -> Similar to exercise #2, but for Voltage x datetime
# 1,0 -> From exercise #3
# 1,1 -> Similar to exercise #2, but for Global Reactive Power x datetime
plot4 <- function(data) {
  par(mfrow= c(2,2))
  plot2(data)
  with(data, plot(DateTime, Voltage, type="l", main = "",xlab="datetime"))
  plot3(data, FALSE)
  with(data, plot(DateTime, Global_reactive_power, type="l", main = "",xlab="datetime"))
  par(mfrow= c(1,1))
}

plotExercise(
  function() plot4(data),
  "plot4.png"
)