-module(ping_ex).
-export([start/0, ping/1, ping/2]).

ping(Msg) -> ping(10, Msg).

ping(0,_) -> done;
ping(N, Msg) ->
  receive
    {Pid} -> io:fwrite("~s~n", [Msg]),
	     Pid ! { self() }
  end,
  ping(N-1, Msg).


start() ->
  Ping = spawn(ping_ex, ping, ["ping"]),
  Pong = spawn(ping_ex, ping, ["pong"]),
  Ping ! {Pong}.
