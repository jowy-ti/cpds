-module(worker).
-export([first_worker/2, generic_worker/3]).

first_worker(N, PidControl) -> 
    when N > 1 -> NextWorker = spawn(generic_worker, [, N-1, PidControl]);
    dowork(PidControl, NextWorker)

generic_worker( ,N ,PidControl) ->
    dowork(PidControl, NextWorker)

dowork(PidControl, PidNext) ->
    PidControl ! {self(), eat}
    PidNext ! token
        receive
            token -> dowork(PidControl, PidNext)
        end.