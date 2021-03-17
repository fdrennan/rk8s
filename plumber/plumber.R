
#* Wait 5 seconds and then return the current time
#* @serializer json
#* @param wait_time
#* @get /wait
function(req, res, wait_time = 10) {
  time_diff(wait_time)
}



