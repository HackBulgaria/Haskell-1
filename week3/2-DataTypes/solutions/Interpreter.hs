module Interpreter where

import qualified Data.Map.Strict as Map
  ( Map(..)
  , lookup
  , insert
  , updateWithKey
  , empty
  )
import Control.Applicative (liftA2)


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

calculate :: Oper -> Value -> Value -> Value
calculate oper =
  case oper of
  Plus  -> (+)
  Minus -> (-)
  Mult  -> (*)
  Div   -> div
  Mod   -> mod
  Gt    -> bool2Int (>)
  Ge    -> bool2Int (>=)
  Lt    -> bool2Int (<)
  Le    -> bool2Int (<=)
  Eql   -> bool2Int (==)

-- Making a comparison function to return 0 and 1 instead of False and True
bool2Int :: Ord a => (a -> a -> Bool) -> a -> a -> Int
bool2Int op x y = if op x y then 1 else 0

-- Evaluating an expression given the variables in the environment
evalE :: Expr -> Variables -> Maybe Value
evalE (Var var)   vars = Map.lookup var vars
evalE (Val val)   _    = Just val
evalE (Op x op y) vars = liftA2 (calculate op) x' y'
  where x' = evalE x vars
        y' = evalE y vars

-- Executing a single statement given the variables in the environment
execStatement :: Statement -> Variables -> Variables
execStatement s vars =
  case s of
  Assign var expr -> maybe vars (flip (Map.insert var) vars) $
                       evalE expr vars
  Incr var -> Map.updateWithKey (\_ -> Just . (+1)) var vars
  Decr var -> Map.updateWithKey (\_ -> Just . (subtract 1)) var vars
  If cond body1 body2 -> flip execStatement vars $
    if evalE cond vars == Just 1 then body1 else body2
  For init cond step body -> loop cond step body (execStatement init vars)
    where loop cond step body vars' =
            let vars'' = execStatement step $ execStatement body vars'
            in if evalE cond vars' == Just 1
               then loop cond step body vars''
               else vars'

-- Stepping from State to State
execS :: State -> State
execS (State (s:ss) vars) = State ss $ execStatement s vars
execS s                   = s
