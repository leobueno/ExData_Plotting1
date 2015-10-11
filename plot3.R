#Load data
source("setup.R")

# Plot 3
# 3 line plots on the same graph, one for eache séries Sub_metering sequence (1,2,3)
# No title
# y = energy sub metering / 0 - 30 by 10
# x = time / Thu - Fri - Sat
# Sequence colors are black, red and blue
# Legend on topright
plot3 <- function(data, drawborder = TRUE) {
  with(data, plot(DateTime, Sub_metering_1, type="l", main = "", ylab = "Energy Sub Metering", xlab="", col="black"))
  with(data, lines(DateTime, Sub_metering_2, type="l", main = "", ylab = "Energy Sub Metering", xlab="", col="red"))
  with(data, lines(DateTime, Sub_metering_3, type="l", main = "", ylab = "Energy Sub Metering", xlab="", col="blue"))
  legend(
      "topright", 
      lty=c(1,1), 
      col=c("black","red","blue"), 
      legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
      cex = 0.9,
      bty = if (drawborder) {"o"} else {"n"}
      )
}

plotExercise(
  function() plot3(data),
  "plot3.png"
)