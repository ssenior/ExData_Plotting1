###############################################################################
# plot1.R
#
# Reads in the Electric power consumption dataset from the UC Irvine Machine 
# Learning Repository, a popular repository for machine learning datasets, and 
# creates a histogram of Global Active Power.
# The output is saved to a plot1.png file in the working directory.
#
#
###############################################################################

# load the utility script that loads dataset
source('load_dataset.R')

plot1 <- function(filepath  = "household_power_consumption.txt") {
    
    # load in the dataset
    dt_data <- load_dataset(filepath)
    
    # subset the data to between '2007-02-01' and '2007-02-02'
    plot_data <- subset(dt_data, Date >= '2007-02-01' & Date <= '2007-02-02')
    
    # set the appropriate graph layout
    par(mfrow = c(1,1))
    
    # plot the histograph
    png('./plot1.png', width = 480, height = 480)
    hist(plot_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
    dev.off()
    
}