module Main where

import System.Environment (getArgs)
import StatementParser (interpret)
import Interpreter (runProgram)
import Parser (parse)
import Control.Arrow (first)
import Control.Applicative


main :: IO ()
main = do
  args <- getArgs
  case args of
    (fileName:_) -> do
      content <- readFile fileName
      let program = parse interpret content
      let state = first runProgram <$> program
      case state of
        Just (s, "") -> putStrLn s
        Nothing      -> error "Ill-formed program!"
    _            -> error "Usage: runhaskell Main.hs <filename>"
