
let process_started name =
  Logs.info (fun m -> m "Started process %s" name)

let process_terminated =
  Logs.info (fun m -> m "Exiting process")

let square_func_executed res =
  let ans = string_of_int res in
  Logs.debug (fun m -> m "sq function executed with result %s" ans)

let cubed_func_executed res =
  let ans = string_of_int res in
  Logs.debug (fun m -> m "cb function executed with result %s" ans)
