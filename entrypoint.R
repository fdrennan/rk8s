# entrypoint.R
library(plumber)
library(glue)
library(stringr)
library(jsonlite)

pr <- plumber::plumb("plumber.R")

pr$run(
  host = Sys.getenv("HOST"),
  port = as.numeric(Sys.getenv("PORT")),
  swagger = Sys.getenv("SWAGGER"),
)
