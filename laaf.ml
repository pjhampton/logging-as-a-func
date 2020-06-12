open Cmdliner
open Math

let laaf_dispatch app_t () =
  Logger.process_started app_t;
  let sq_ans = Math.sq 22 in 
  Logger.square_func_executed sq_ans;
  let cb_ans = Math.cb 22 in 
  Logger.square_func_executed cb_ans;
  let sq2_ans = Math.sq 11 in 
  Logger.square_func_executed sq2_ans;
  Logger.process_terminated ()

let application_term =
  Arg.(value
  & opt string "laaf"
  & info [ "name" ] ~docv:"Process name" ~doc:"Process name")

let service_info =
  let doc = "tests out ocaml structured logging" in
  Term.info "laas" ~version:"1.0.0" ~doc ~exits:Term.default_exits

let laas_t =
  Term.(
    const laaf_dispatch
    $ application_term
    $ Ezlogs_cli.logging ~default:Json)

let () = Term.exit @@ Term.eval (laas_t, service_info)
