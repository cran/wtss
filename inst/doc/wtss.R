## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- echo = FALSE, fig.align="center", fig.height=3, fig.width=5, fig.cap="A Normalized Difference Vegetation Index (NDVI) time series"----
knitr::include_graphics(system.file("extdata/markdown/figures", "arrays.jpg", package = "wtss"))

## ---- echo = FALSE, fig.align="center", fig.height=3, fig.width=5, fig.cap="Events associated to a time series"----
knitr::include_graphics(system.file("extdata/markdown/figures", "time_series.png", package = "wtss"))

## ------------------------------------------------------------------------
# Connect to the WTSS server at INPE Brazil
wtss_inpe <-  wtss::WTSS("http://www.esensing.dpi.inpe.br/wtss/")

## ------------------------------------------------------------------------
# Connect to the WTSS server at INPE Brazil
wtss::list_coverages(wtss_inpe)

## ------------------------------------------------------------------------
# Connect to the WTSS server at INPE Brazil
wtss::describe_coverage(wtss_inpe, name = "MOD13Q1")

## ------------------------------------------------------------------------
# Coverage description available in the wtss object
wtss_inpe$description

## ------------------------------------------------------------------------
# Request a time series from the "MOD13Q1" coverage
ts   <- wtss::time_series(wtss_inpe, name = "MOD13Q1", 
        attributes = c("ndvi","evi"), longitude = -45.00, latitude  = -12.00,
        start_date = "2000-02-18", end_date = "2016-12-18")
ts

## ------------------------------------------------------------------------
# Showing the contents of a time series
ts$time_series[[1]]

## ---- fig.align="center", fig.height=3, fig.width=5, fig.cap="A Normalized Difference Vegetation Index (NDVI) time series"----
# Plotting the contents of a time series
plot(ts)

## ---- fig.align="center", fig.height=3, fig.width=5, fig.cap="Breaks on an NDVI time series detected by BFAST"----
library(bfast)
# create a connection using a serverUrl
server <-  wtss::WTSS("http://www.esensing.dpi.inpe.br/wtss/")

# get a time series for the "ndvi" attribute
ndvi_wtss <- wtss::time_series(server, "MOD13Q1", attributes = c("ndvi"), 
                         latitude = -10.408, longitude = -53.495, 
                         start = "2000-02-18", end = "2016-01-01")

# convert to ts
ndvi_ts <- wtss::wtss_to_ts(ndvi_wtss, band = "ndvi")

# detect trends
bf <- bfast::bfast01(ndvi_ts)
# plot the result
plot(bf)

