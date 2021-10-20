module Main where

import PreProcess (preProcess)
import System.Environment (getArgs)

main :: IO ()
main = getArgs >>= preProcess
