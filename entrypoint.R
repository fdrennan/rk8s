# entrypoint.R
library(plumber)
library(glue)
library(stringr)
library(jsonlite)


HOST <- "0.0.0.0"
PORT <- 8000
SWAGGER_UI <- TRUE # PLUMBER ONLY

pr <- plumber::plumb("plumber.R")
pr$run(
  host = HOST,
  port = PORT,
  swagger = SWAGGER_UI
)
