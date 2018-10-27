-module(sort_ex).
-export([qsort/1]).


%% Quick Sort
qsort([]) -> [];
qsort([Single]) -> [Single];
qsort([Head | Tail]) ->
  {Smallers, Greaters} = qsort(Head, [], [], Tail),
  Sm = qsort(Smallers),
  Gr = qsort(Greaters),
  Sm ++ [Head] ++ Gr.

qsort(_Head, Sm, Gr, []) -> {Sm, Gr};
qsort(Head, Sm, Gr, [Ht | Tt]) when Ht =< Head ->
  qsort(Head, [Ht | Sm], Gr, Tt);
qsort(Head, Sm, Gr, [Ht | Tt]) ->
  qsort(Head, Sm, [Ht | Gr], Tt).
