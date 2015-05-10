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
png(file = 'plot2.png', width = 480, height = 480)

# plot the "Global Active Power" over datetime
with(data, plot(DateTime, Global_active_power, 
                  type = 'l',
                  xlab = '', ylab = 'Global Active Power (Kilowatts)'))

# Copy th histogram to a png file
dev.off()
