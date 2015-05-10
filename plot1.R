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



####
#### Create the Histogram
####

# Open a png device
png(file = 'plot1.png', width = 480, height = 480)

# produce the histogram of "Global Active Power"
hist(data$Global_active_power, 
      col = 'red', 
      xlab = 'Global Active Power (kilowatts)', 
      ylab = 'Frequency',
      main = 'Global Active Power')

# Copy th histogram to a png file
dev.off()
