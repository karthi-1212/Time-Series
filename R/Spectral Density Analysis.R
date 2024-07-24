require(zoo)
# Note: Calling library(zoo) again is not needed

# --- Measles Data ---
measles <- read.table("https://web.stanford.edu/class/earthsys214/data/nycmeas.dat.txt", header=F)
colnames(measles) <- c("Date", "Cases")
measles_zoo <- zoo(measles$Cases, order.by = measles$Date)

# Measles Time Series Plot
plot(measles_zoo, xlab = "Date", ylab = "Measles Cases", main = "Measles Cases in NYC", lwd = 1.5)  # Enhanced plot

# Measles Spectral Density
m_spec <- spectrum(measles$Cases, log = "no", spans = c(2, 2), plot = FALSE) 
delta <- 1/2
spec_x <- m_spec$freq / delta
spec_y <- 2 * m_spec$spec
plot(spec_x, spec_y, xlab = "Period (Years)", ylab = "Spectral Density", type = "l", 
     main = "Measles Spectral Density", lwd = 1.5)  # Enhanced plot

# --- Dengue Data ---
dengue <- read.csv("https://web.stanford.edu/class/earthsys214/data/San_Juan_Training_Data.csv", header = TRUE)
dengue_cases_zoo <- zoo(dengue$total_cases, as.Date(dengue$week_start_date))

# Dengue Time Series Plot
plot(dengue_cases_zoo, xlab = "Date", ylab = "Total Dengue Cases", main = "Total Dengue Cases in San Juan", lwd = 1.5) # Enhanced plot

# All Dengue Serotypes
dengue_all_zoo <- zoo(dengue[, 4:7], as.Date(dengue$week_start_date)) 
plot(dengue_all_zoo, xlab = "Date", ylab = list("Dengue 1", "Dengue 2", "Dengue 3", "Dengue 4"), 
     main = "Dengue Cases by Serotype in San Juan", lwd = 1.5)  # Enhanced plot with clearer legend

# Dengue Power Spectrum
d_spec <- spectrum(dengue$total_cases, log = "no", spans = c(5, 5), plot = FALSE)
delta <- 7 / 365
spec_x <- d_spec$freq / delta
spec_y <- 2 * d_spec$spec

plot(spec_x[1:100], spec_y[1:100], xlab = "Period (Years)", ylab = "Spectral Density", 
     type = "l", main = "Dengue Spectral Density", lwd = 1.5)  # Enhanced plot with trimmed range 

#ARMA MODEL
#If you want the ARMA model,install the TSA library, and remove the comment from the code.
