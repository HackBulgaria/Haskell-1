module Statement where

import qualified Data.Map.Strict as Map
  ( Map(..)
  )


data Oper = Plus
          | Minus
          | Mult 
          | Div
          | Mod
          | Gt
          | Ge       
          | Lt  
          | Le
          | Eql
  deriving (Show, Eq)

type Variable = String
type Value    = Int

data Expr = Var Variable
          | Val Value
          | Op  Expr Oper Expr
  deriving (Show, Eq)

data Statement = Assign Variable Expr
               | Incr   Variable
               | Decr   Variable
               | If     Expr Statement Statement
               | For    Statement Expr Statement Statement
  deriving (Show, Eq)

type Variables = Map.Map Variable Value

data State = State [Statement] Variables
  deriving (Show, Eq)
