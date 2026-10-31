-module(pingpong).
-export([start/0, stop/1, ping/0, pong/1, pingloop/1]).

start() -> spawn(pingpong, ping,[]).
stop(Pid) -> Pid ! kill.

ping() ->
    PongPid = spawn(pingpong, pong, [self()]),
    PongPid ! ping,
    pingloop(PongPid).

pingloop(PongPid)  ->
    timer:sleep(500),
    receive
        pong -> PongPid ! ping,
                io:format("Ping received pong~n"),
                pingloop(PongPid);
        kill -> PongPid ! kill
    end.

pong(PingPid) ->
    timer:sleep(500),
    receive
        ping -> PingPid ! pong,
                io:format("Pong received ping~n"),
                pong(PingPid);
        kill -> ok
    end.