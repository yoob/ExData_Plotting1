####
#### Read and prepare data
####

# read the header  
header <- read.table(file = 'household_power_consumption.txt', sep = ';', nrows = 1)

# read the data between 1/2/2007 and 2/2/2007 (d/m/Y)
data <- read.table(file = 'household_power_consumption.txt', header = FALSE, 
                   sep = ';', na.strings = '?', skip = 66637, nrows = 2880)

# set the header
names(data) <- as.character(unname(unlist(header[1,])))

# Add a datetime column
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S")


####
#### Create the plot
####

# Open a png device
png(file = 'plot3.png', width = 480, height = 480)

# plot the "Energy sub metering" over datetime
with(data, plot(DateTime, Sub_metering_1,
                  type = 'n',
                  xlab = '',
                  ylab = 'Energy sub metering'))

with(data, points(DateTime, Sub_metering_1, col = "black", type = 'l'))
with(data, points(DateTime, Sub_metering_2, col = "red", type = 'l'))
with(data, points(DateTime, Sub_metering_3, col = "blue", type = 'l'))
legend('topright', lty = 'solid', col = c('black', 'red', 'blue'), 
        legend = c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'),
        xjust = 1)


# Close the png device
dev.off()
