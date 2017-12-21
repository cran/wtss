## ---- eval = FALSE, echo = TRUE------------------------------------------
#  library(wtss) # R package name is wtss
#  # Connect to a WTSS server
#  ts.server <- WTSS("http://www.dpi.inpe.br/tws/wtss")

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  ts.server
#  ## Object of Class WTSS
#  
#  ## serverUrl:  http://www.dpi.inpe.br/tws/wtss
#  ## listCoverages: MOD13Q1 itobi merge mod13q1_512

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  coverage.name <- "mod13q1_512"
#  cv <- describeCoverage(ts.server, coverage.name)
#  bands <- cv[[names(cv)]]$attributes$name
#  bands
#  ## [1] "ndvi" "evi"  "red"  "nir"  "blue" "mir"
#  
#  # print information about the data
#  cv$mod13q1_512$description
#  # [1] "Vegetation Indices 16-Day L3 Global 250m"
#  

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  # get a time series for the "ndvi" attribute
#  time_series <- wtss::timeSeries(ts.server, coverages = "mod13q1_512", attributes=c("ndvi", "evi"),
#                        latitude=-10.408, longitude=-53.495,
#                        start="2000-02-18", end="2017-02-18")
#  
#  # Plot the time series
#  plot(ts[[1]]$attributes[,1], main=sprintf("Pixel Center Coordinates Time-Series (%5.3f, %5.3f)", ts[[1]]$center_coordinate$latitude, ts[[1]]$center_coordinate$longitude), xlab="Time", ylab="Normalized Difference Vegetation Index")

## ---- echo = FALSE, out.width = "90%"------------------------------------
knitr::include_graphics(system.file("extdata/plot-ts-timeseries.png", package = "wtss"))

