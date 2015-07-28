module StatementParser where

import Parser
import Statement
import Control.Applicative
import qualified Data.Char as C
  ( isAlpha
  , isDigit
  )


plusP :: Parser Oper
plusP = const Plus <$> char '+'

minusP :: Parser Oper
minusP = const Minus <$> char '-'

multP :: Parser Oper
multP = const Mult <$> char '*'

divP :: Parser Oper
divP = const Div <$> char '/'

modP :: Parser Oper
modP = const Mod <$> char '%'

geP :: Parser Oper
geP = const Ge <$> string ">="

gtP :: Parser Oper
gtP = const Gt <$> char '>'

leP :: Parser Oper
leP = const Le <$> string "<="

ltP :: Parser Oper
ltP = const Lt <$> char '<'

eqlP :: Parser Oper
eqlP = const Eql <$> string "=="

oper :: Parser Oper
oper = plusP
    <|> minusP
    <|> multP
    <|> divP
    <|> modP
    <|> geP
    <|> gtP
    <|> leP
    <|> ltP
    <|> eqlP

variable :: Parser Variable
variable = oneOrMore $ satisfy C.isAlpha

value :: Parser Value
value = read <$> oneOrMore (satisfy C.isDigit)

varP :: Parser Expr
varP = Var <$> variable

valP :: Parser Expr
valP = Val <$> value

opP :: Parser Expr
opP = liftA3 Op (varP <|> valP <|> inBraces expr)
                (spaces *> oper <* spaces)
                (varP <|> valP <|> inBraces expr)

expr :: Parser Expr
expr = opP <|> varP <|> valP

terminate :: Parser a -> Parser a
terminate = (<* char ';')

assignP :: Parser Statement
assignP = liftA2 Assign ((string "var " *> variable <|> variable)
    <* spaces <* char '=')
  (spaces *> expr)

incrP :: Parser Statement
incrP = Incr <$> (string "++" *> variable)

decrP :: Parser Statement
decrP = Decr <$> (string "--" *> variable)

ifP :: Parser Statement
ifP = liftA3 If (string "if" *> spaces *> expr)
                (inBrackets statement)
                (spaces *> string "else" *> spaces
                    *> inBrackets statement)

forP :: Parser Statement
forP = string "for" *> spaces *>
    (inBraces $ For <$> terminate statement
      <*> (spaces *> terminate expr)
      <*> (spaces *> statement))
    <*> (spaces *> (inBrackets $ terminate statement))

statement :: Parser Statement
statement = assignP
         <|> incrP <|> decrP
         <|> ifP <|> forP

interpret :: Parser [Statement]
interpret = oneOrMore $ (terminate statement <|> statement) <* spaces
