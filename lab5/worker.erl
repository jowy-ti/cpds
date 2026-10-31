-module(worker).
-export([first_worker/2, generic_worker/3, dowork/2]).

first_worker(N, PidControl) when N > 1 -> 
    NextWorker = spawn(worker,  generic_worker, [self(), N-1, PidControl]),
    dowork(PidControl, NextWorker);
first_worker(_N, PidControl) ->
    dowork(PidControl, self()).

generic_worker(PredPid, N, PidControl) when N > 1 -> 
    NextWorker = spawn(worker, generic_worker, [PredPid, N-1, PidControl]),
    dowork(PidControl, NextWorker);
generic_worker(PredPid, _N, PidControl) ->
    dowork(PidControl, PredPid).

dowork(PidControl, PidNext) ->
        receive
            token -> PidControl ! {self(), eat},
                    PidNext ! token,
                    dowork(PidControl, PidNext);
            stop -> PidNext ! stop,
            ok
        end.