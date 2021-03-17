#' time_diff
#' @export time_diff
time_diff <- function(wait_time = 10) {
  start_time <- Sys.time()
  wait_time <- as.numeric(wait_time)
  if (wait_time > 60) {
    stop("Wont wait that long")
  }
  Sys.sleep(wait_time)
  list(time = Sys.time(), start_time = start_time)
}
