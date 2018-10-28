module Fact where

fact :: Int -> Int
fact n = fact' n 1
  where fact' 0 _   = 1
        fact' 1 acc = acc
        fact' n acc = fact' (n-1) (n*acc)
