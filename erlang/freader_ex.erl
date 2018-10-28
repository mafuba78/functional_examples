-module(freader_ex).
-export([read_file/1]).

read_file(Filename) ->
  {ok, Fd} = file:open(Filename, read),
  case read_whole_file(Fd) of
    {error, Err} -> file:close(Fd),
		    io:fwrite("~s~n", [Err]),
		    {error, Err};
    eof -> file:close(Fd),
	   ok
  end.

%% Recursively read the file line by line
read_whole_file(Fd) ->
  case file:read_line(Fd) of
    {ok, Line} -> io:fwrite("~s", [Line]),
		  read_whole_file(Fd);
    eof -> eof;
    {error, Err} -> {error, Err}
  end.
