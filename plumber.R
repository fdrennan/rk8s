# plumber.R
alive <<- TRUE

#* Determine if an integer is odd or even
#* @serializer json
#* @param int Integer to test for parity
#* @get /parity
function(int) {
  if (as.integer(int) %% 2 == 0) "even" else "odd"
}

#* Wait 5 seconds and then return the current time
#* @serializer json
#* @get /wait
function() {
  Sys.sleep(5)
  list(time = Sys.time())
}

#* Force the health check to fail
#* @post /fail
function() {
  alive <<- FALSE
  NULL
}

#* Try quitting
#* @post /quit
function() {
  quit()
}

#* Health check. Returns "OK".
#* @serializer json
#* @get /health
function() {
  if (!alive) stop() else "OK"
}
