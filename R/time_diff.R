#' time_diff
#' @importFrom glue glue
#' @description simple wait utility
#' @param wait_time Wait time in seconds
#' @export time_diff
time_diff <- function(wait_time = 10) {
  start_time <- Sys.time()
  wait_time <- as.numeric(wait_time)
  if (wait_time > 60) {
    message(glue("On time {wait_time}"))
    stop("Wont wait that long")
  }
  Sys.sleep(wait_time)
  list(time = Sys.time(), start_time = start_time)
}
