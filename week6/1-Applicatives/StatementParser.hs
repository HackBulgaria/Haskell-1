module StatementParser where

import Parser
import Statement
import Control.Applicative
import qualified Data.Char as C
  ( isAlpha
  , isDigit
  )


oper :: Parser Oper
oper = undefined

variable :: Parser Variable
variable = undefined

value :: Parser Value
value = undefined

expr :: Parser Expr
expr = undefined

assignP :: Parser Statement
assignP = undefined

incrP :: Parser Statement
incrP = undefined

decrP :: Parser Statement
decrP = undefined

ifP :: Parser Statement
ifP = undefined

forP :: Parser Statement
forP = undefined

statement :: Parser Statement
statement = undefined
